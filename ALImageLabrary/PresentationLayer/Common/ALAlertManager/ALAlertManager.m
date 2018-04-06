//
//  ALAlertManager.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALAlertManager.h"

#import <objc/runtime.h>

#import "UIAlertController+Present.h"

#pragma mark - Alert description

@implementation UIAlertController(ALAlertDescription)

- (ALAlertDescription *)description {
    return objc_getAssociatedObject(self, @selector(description));
}

- (void)setDescription:(ALAlertDescription *)description {
    objc_setAssociatedObject(self, @selector(description), description, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark - Alert manager

static id _sharedManager;

@interface ALAlertManager()

@property (nonatomic, assign) BOOL alertControllerAlreadyShow;
@property (nonatomic, strong) NSMutableArray *alertControllers;

@end

@implementation ALAlertManager

+ (instancetype)sharedManager {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _alertControllers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)showAlertWithMessage:(NSString *)message {
    [self showAlertWithTitle:@"Attention!" message:message];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [self showAlertWithTitle:title message:message cancelHandler:nil];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
             cancelHandler:(ALAlertActionHandler)handler {
    
    ALAlertAction *action = [ALAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleCancel
                                                   handler:handler];
    
    ALAlertDescription *description = [ALAlertDescription alertDescriptionWithTitle:title
                                                                            message:message
                                                                            actions:@[ action ]];
    [self showAlertWithDescription:description];
}

- (void)showAlertWithDescription:(ALAlertDescription *)description {
    if (![self isAlerControllerAlreadyExists:description]) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:description.title
                                                                            message:description.message
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        if (description.textFieldsConfigurationHandlers.count) {
            for (id handler in description.textFieldsConfigurationHandlers) {
                [controller addTextFieldWithConfigurationHandler:handler];
            }
        }
        
        if (description.actions.count) {
            for (ALAlertAction *proxyAction in description.actions) {
                __weak typeof(self) weakSelf = self;
                UIAlertAction *action = [UIAlertAction actionWithTitle:proxyAction.title
                                                                 style:proxyAction.style
                                                               handler:^(UIAlertAction *action) {
                                                                   [weakSelf alertControllerActionHandler:controller];
                                                                   if (proxyAction.handler) {
                                                                       proxyAction.handler(action);
                                                                   }
                                                               }];
                [controller addAction:action];
            }
        }
        [controller setDescription:description];
        [self add:controller];
        [self next];
    }
}

#pragma mark - Private Methods

- (void)add:(UIAlertController *)controller {
    @synchronized([self class]) {
        [self.alertControllers addObject:controller];
    }
}

- (void)remove:(UIAlertController *)controller {
    @synchronized([self class]) {
        [self.alertControllers removeObject:controller];
    }
}

- (void)next {
    @synchronized([self class]) {
        if (!self.alertControllers.count ||
            [self alertControllerAlreadyShow]) {
            return;
        }
        [self setAlertControllerAlreadyShow:YES];
        UIAlertController *controller = self.alertControllers.firstObject;
        [controller presentInContextWindow];
    }
}

- (BOOL)isAlerControllerAlreadyExists:(ALAlertDescription *)description {
    @synchronized([self class]) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"description.title == %@ AND description.message == %@",
                                  description.title,
                                  description.message];
        return ([self.alertControllers filteredArrayUsingPredicate:predicate].count > 0);
    }
}

#pragma mark - Action Handler Methods

- (void)alertControllerActionHandler:(UIAlertController *)controller {
    [self setAlertControllerAlreadyShow:NO];
    [self remove:controller];
    [self next];
}

@end
