//
//  ALMainViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainViewController.h"
#import "ALMainView.h"

#import "ALMainViewOutput.h"
#import "UIViewController+STViperModuleTransitionHandler.h"

@interface ALMainViewController ()

@property (nonatomic, strong) ALMainView *view;

@end

@implementation ALMainViewController

@dynamic view;

- (void)loadView {
    self.view = [[ALMainView alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.output viewDidLoad];
}

#pragma mark - ALMainViewInput

- (void)setupInitialState {
	
}

#pragma mark - Private Methods



@end
