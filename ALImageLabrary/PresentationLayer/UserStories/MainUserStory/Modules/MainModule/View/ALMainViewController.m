//
//  ALMainViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainViewController.h"
#import "ALMainView.h"

#import "ALAlertManager.h"

#import "ALMainViewOutput.h"
#import "UIViewController+ALViperModuleTransitionHandler.h"

#import "ALMainTableCell.h"

#import "UIColor+ALColors.h"

static NSString * const ALMainCellId = @"ALMainCellId";

@interface ALMainViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ALMainView *view;

@end

@implementation ALMainViewController

@dynamic view;

- (void)loadView {
    self.view = [[ALMainView alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    self.view.collectionView.dataSource = self;
    self.view.collectionView.delegate = self;
    [self.view.collectionView registerClass:[ALMainTableCell class] forCellWithReuseIdentifier:ALMainCellId];
	
	[self.output viewDidLoad];
}

#pragma mark - ALMainViewInput

- (void)setupInitialState {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:ALAssetArrowBack]
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(backAction)];
    
    UIBarButtonItem *rigthButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:ALAssetArrowNext]
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(nextAction)];
    
    leftButton.tintColor = [UIColor alMainColorElement];
    rigthButton.tintColor = [UIColor alMainColorElement];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.rightBarButtonItem = rigthButton;
    
    self.view.titleLabel.text = [NSString stringWithFormat:@"%@ 0", ALLocalize(@"main.page")];
    
    self.navigationItem.titleView = self.view.titleLabel;
    [self.navigationItem.titleView sizeToFit];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [[ALAlertManager sharedManager] showAlertWithTitle:title message:message];
}

- (void)reloadCollectionView {
    [self.view.collectionView reloadData];
}

- (void)reloadCollectionViewAtIndexPath:(NSIndexPath *)path {
    [self.view.collectionView reloadItemsAtIndexPaths:@[path]];
}

- (void)showShadowViewWithIndicator {
    self.view.shadowView.hidden = NO;
    [self.view.indicatorView startAnimating];
}

- (void)hideShadowViewWithIndicator {
    self.view.shadowView.hidden = YES;
    [self.view.indicatorView stopAnimating];
}

- (void)changeNavigationTitleWithPage:(NSInteger)page {
    self.view.titleLabel.text = [NSString stringWithFormat:@"%@ %ld", ALLocalize(@"main.page"), (long)page];
    self.navigationItem.titleView = self.view.titleLabel;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.output numberOfRowsInSection];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALMainTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ALMainCellId forIndexPath:indexPath];
    
    id item = [self.output itemAtIndex:indexPath.row];
    [cell configureWithItem:item];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self getSizeForItem];
}

#pragma mark - UICollectionViewDataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.output didTouchCollectionItemWithIndex:indexPath.row];
}

#pragma mark - Private Methods

- (void)backAction {
    [self.output didTouchBackButton];
}

- (void)nextAction {
    [self.output didTouchNextButton];
}

- (CGSize)getSizeForItem {
    CGFloat availableWidth = self.view.collectionView.frame.size.width - 20.f;
    CGFloat widthPerItem   = availableWidth / 3;
    return CGSizeMake(widthPerItem, widthPerItem);
}

@end
