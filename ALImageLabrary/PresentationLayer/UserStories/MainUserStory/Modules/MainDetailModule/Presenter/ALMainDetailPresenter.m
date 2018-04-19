//
//  ALMainDetailPresenter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailPresenter.h"

#import "ALMainDetailViewInput.h"
#import "ALMainDetailRouterInput.h"
#import "ALMainDetailInteractorInput.h"

#import "ALMainTableItem.h"
#import "ALMainTableItemImage.h"

static NSString * const ALMainDetailPresenterPoints = @"points";

@interface ALMainDetailPresenter () {
    ALMainTableItem *_mainItem;
    NSMutableArray *_arrayOfComments;
}

@end

@implementation ALMainDetailPresenter

#pragma mark - ALMainDetailModuleInput

- (void)configureWithItem:(ALMainTableItem *)item {
    _mainItem = item;
}

#pragma mark - ALMainDetailViewOutput

- (void)viewDidLoad {
    _arrayOfComments = [NSMutableArray array];
    [self getCommentsWithGalleryId:_mainItem.itemCoverId];
    [self.view setupInitialStateWithItem:_mainItem];
}

- (void)didTouchBackButton {
    [self.router closeMainDetailModule];
}

- (void)didTouchExitButton {
    [self.router openLoginModule];
}

- (NSInteger)numberOfRowsInSection {
    return _arrayOfComments.count;
}

- (ALMainDetailTableItem *)itemAtIndex:(NSInteger)index {
    return [_arrayOfComments objectAtIndex:index];
}

#pragma mark - Private Methods

- (void)getCommentsWithGalleryId:(NSString *)galleryId {
    if (![self.interactor checkInternetConnectionAvailability]) {
        [self.view showAlertWithTitle:ALLocalize(@"alert.header") message:ALLocalize(@"alert.noinet")];
        return;
    }
    [self.view showShadowViewWithIndicator];
    [self.interactor getCommentsWithGalleryId:galleryId completionHandler:^(id data) {
        if ([self.interactor checkStatusOKFromResponse:data]) {
            [self populateCommentsItemsFromResponse:data];
            [self.view reloadTableView];
        }
        [self.view hideShadowViewWithIndicator];
    }];
}

- (void)populateCommentsItemsFromResponse:(id)response {
    if ([response isKindOfClass:[NSArray class]]) {
        [_arrayOfComments removeAllObjects];
        [_arrayOfComments addObjectsFromArray:response];
        [self sortCommentsByPoints];

    }
}

- (void)sortCommentsByPoints {
    if (_arrayOfComments.count) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:ALMainDetailPresenterPoints ascending:NO];
        [_arrayOfComments sortUsingDescriptors:@[sortDescriptor]];
    }
}

@end
