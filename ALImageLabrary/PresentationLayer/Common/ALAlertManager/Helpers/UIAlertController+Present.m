//
//  UIAlertController+Present.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "UIAlertController+Present.h"

#import <objc/runtime.h>

#import "ALWindowLevel.h"
#import "ALAletViewController.h"

@implementation UIAlertController (Present)

- (UIWindow *)contextWindow {
    return objc_getAssociatedObject(self, @selector(contextWindow));
}

- (void)setContextWindow:(UIWindow *)contextWindow {
    objc_setAssociatedObject(self, @selector(contextWindow), contextWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)presentInContextWindow {
    self.contextWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.contextWindow.windowLevel = ALWindowLevelAtType(ALWindowTypeAlert);
    self.contextWindow.rootViewController = [[ALAletViewController alloc] init];
    self.contextWindow.tintColor = [UIApplication sharedApplication].delegate.window.tintColor;
    [self.contextWindow makeKeyAndVisible];
    
    [self.contextWindow.rootViewController presentViewController:self
                                                        animated:YES
                                                      completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.contextWindow.hidden = YES;
    self.contextWindow = nil;
}

@end

