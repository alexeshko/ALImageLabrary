//
//  ALMainDetailViewController.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailViewController.h"
#import "ALMainDetailView.h"

#import "ALAlertManager.h"

#import "ALMainDetailViewOutput.h"
#import "UIViewController+ALViperModuleTransitionHandler.h"

#import "ALMainTableItem.h"
#import "ALMainTableItemImage.h"

#import "ALMainDetailTableCell.h"

#import "UIColor+ALColors.h"

static NSString * const ALDetailCellId = @"ALDetailCellId";

@interface ALMainDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ALMainDetailView *view;

@end

@implementation ALMainDetailViewController

@dynamic view;

- (void)loadView {
    self.view = [[ALMainDetailView alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    self.view.commentsView.delegate = self;
    self.view.commentsView.dataSource = self;
    [self.view.commentsView registerClass:[ALMainDetailTableCell class] forCellReuseIdentifier:ALDetailCellId];

	[self.output viewDidLoad];
}

#pragma mark - ALMainDetailViewInput

- (void)setupInitialStateWithItem:(ALMainTableItem *)item {
    if (item.images.count) {
        ALMainTableItemImage *imageItem = [item.images firstObject];
        self.view.imageView.image = imageItem.itemImage;
        self.view.authorLabel.text = item.itemAuthor;
        self.view.dateLabel.text = imageItem.itemDate;
        self.view.viewsLabel.text = imageItem.itemViews;
        self.view.coverIdLabel.text = item.itemCoverId;
        NSString *descriptionText =  imageItem.itemDescription ? imageItem.itemDescription : imageItem.itemTitle;
        self.view.descriptionLabel.text = descriptionText ? descriptionText : ALLocalize(@"maindetail.emptydescription");
    }
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:ALAssetArrowBack]
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(backAction)];
    
    UIBarButtonItem *rigthButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:ALAssetArrowHome]
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(exitAction)];
    
    leftButton.tintColor = [UIColor alMainColorElement];
    rigthButton.tintColor = [UIColor alMainColorElement];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.rightBarButtonItem = rigthButton;
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [[ALAlertManager sharedManager] showAlertWithTitle:title message:message];
}

- (void)showShadowViewWithIndicator {
    self.view.shadowView.hidden = NO;
    [self.view.indicatorView startAnimating];
}

- (void)hideShadowViewWithIndicator {
    self.view.shadowView.hidden = YES;
    [self.view.indicatorView stopAnimating];
}

- (void)reloadTableView {
    [self.view.commentsView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.output numberOfRowsInSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALMainDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ALDetailCellId];
    if (cell == nil) {
        cell = [[ALMainDetailTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ALDetailCellId];
    }
    
    id item = [self.output itemAtIndex:indexPath.row];
    [cell configureWithItem:item];
    
    return cell;
}

#pragma mark - Private Methods

- (void)backAction {
    [self.output didTouchBackButton];
}

- (void)exitAction {
    [self.output didTouchExitButton];
}

@end
