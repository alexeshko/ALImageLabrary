//
//  ALLoginViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginViewController.h"
#import "ALLoginView.h"

#import "ALLoginViewOutput.h"
#import "UIViewController+ALViperModuleTransitionHandler.h"

@interface ALLoginViewController ()

@property (nonatomic, strong) ALLoginView *view;

@end

@implementation ALLoginViewController

@dynamic view;

- (void)loadView {
    self.view = [[ALLoginView alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.output viewDidLoad];
}

#pragma mark - ALLoginViewInput

- (void)setupInitialState {
	
}

#pragma mark - Private Methods



@end
