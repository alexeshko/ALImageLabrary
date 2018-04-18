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
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(quitAction)];
    
    UIBarButtonItem *rigthButtonBack = [[UIBarButtonItem alloc] initWithTitle:@"< "
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(backAction)];
    
    UIBarButtonItem *rigthButtonNext = [[UIBarButtonItem alloc] initWithTitle:@" >"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(nextAction)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.title = [NSString stringWithFormat:@"Страница 0"];
    self.navigationItem.rightBarButtonItems = @[rigthButtonNext, rigthButtonBack];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [[ALAlertManager sharedManager] showAlertWithTitle:title message:message];
}

- (void)reloadCollectionView {
    [self.view.collectionView reloadData];
}

- (void)changeNavigationTitleWithPage:(NSInteger)page {
    self.navigationItem.title = [NSString stringWithFormat:@"Страница %ld", (long)page];
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
    CGFloat availableWidth = self.view.collectionView.frame.size.width - 20.f;
    CGFloat widthPerItem   = availableWidth / 3;
    return CGSizeMake(widthPerItem, widthPerItem);
}

#pragma mark - UICollectionViewDataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private Methods

- (void)quitAction {
    [self.output didTouchQuitButton];
}

- (void)backAction {
    [self.output didTouchBackButton];
}

- (void)nextAction {
    [self.output didTouchNextButton];
}

@end
