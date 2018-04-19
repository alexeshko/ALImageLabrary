//
//  ALLoginViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginViewController.h"
#import "ALLoginView.h"

#import "ALAlertManager.h"

#import "ALLoginViewOutput.h"
#import "UIViewController+ALViperModuleTransitionHandler.h"

@interface ALLoginViewController ()

@property (nonatomic, strong) ALLoginView *view;

@end

@implementation ALLoginViewController

@dynamic view;

#pragma mark ‐ Lifecycle

- (void)loadView {
    self.view = [[ALLoginView alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userLocationAction:)
                                                     name:ALLoginUserLocation
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    [self addButtonActions];
	
	[self.output viewDidLoad];
}

#pragma mark - ALLoginViewInput

- (void)setupInitialState {
    // Handle initial state
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [[ALAlertManager sharedManager] showAlertWithTitle:title message:message];
}

#pragma mark - Private Methods

- (void)addButtonActions {
    [self.view.joinButton addTarget:self
                             action:@selector(joinAction)
                   forControlEvents:UIControlEventTouchUpInside];
}

- (void)joinAction {
    [self.output didTouchJoinButton];
}

- (void)userLocationAction:(NSNotification *)notification {
    NSString *city = [notification.userInfo objectForKey:@"city"];
    NSString *currentIP = [notification.userInfo objectForKey:@"ip"];
    self.view.ipLabel.text = [NSString localizedStringWithFormat:@"%@: %@ | %@: %@", ALLocalize(@"login.yourcity"), city, ALLocalize(@"login.yourip"), currentIP];
    [self.output didTakeCurrentIP:currentIP];
}

@end
