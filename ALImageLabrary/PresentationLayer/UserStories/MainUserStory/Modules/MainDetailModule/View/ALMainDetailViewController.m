//
//  ALMainDetailViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailViewController.h"
#import "ALMainDetailView.h"

#import "ALMainDetailViewOutput.h"
#import "UIViewController+ALViperModuleTransitionHandler.h"

@interface ALMainDetailViewController ()

@property (nonatomic, strong) ALMainDetailView *view;

@end

@implementation ALMainDetailViewController

@dynamic view;

- (void)loadView {
    self.view = [[ALMainDetailView alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output viewDidLoad];
}

#pragma mark - ALMainDetailViewInput

- (void)setupInitialState {

}

#pragma mark - Private Methods



@end
