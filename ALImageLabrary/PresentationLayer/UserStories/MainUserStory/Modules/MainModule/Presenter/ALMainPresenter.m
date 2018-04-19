//
//  ALMainPresenter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainPresenter.h"

#import "ALMainViewInput.h"
#import "ALMainRouterInput.h"
#import "ALMainInteractorInput.h"

#import "ALMainTableItem.h"
#import "ALMainTableItemImage.h"

@interface ALMainPresenter () {
    NSString *_currentIP;
    NSMutableArray *_collectionItems;
    NSInteger _currentPage;
    BOOL isLoadingState;
}

@end

@implementation ALMainPresenter

#pragma mark - ALMainModuleInput

- (void)configureWithCurrentIP:(NSString *)currentIP {
    _currentIP = currentIP;
}

#pragma mark - ALMainViewOutput

- (void)viewDidLoad {
    _currentPage = 0;
    _collectionItems = [NSMutableArray array];
    [self getCollectionItemsWithPage:_currentPage];
    [self.view setupInitialState];
}

- (void)didTouchBackButton {
    if (_currentPage > 0) {
        if (isLoadingState) {
            return;
        }
        _currentPage -= 1;
        [self.view changeNavigationTitleWithPage:_currentPage];
        [self getCollectionItemsWithPage:_currentPage];
    }
}

- (void)didTouchNextButton {
    if (isLoadingState) {
        return;
    }
    _currentPage += 1;
    [self.view changeNavigationTitleWithPage:_currentPage];
    [self getCollectionItemsWithPage:_currentPage];
}

- (void)didTouchCollectionItemWithIndex:(NSInteger)index {
    if (_collectionItems.count) {
        ALMainTableItem *item = [_collectionItems objectAtIndex:index];
        [self.router openMainDetailModuleWithItem:item];
    }
}

- (NSInteger)numberOfRowsInSection {
    return _collectionItems.count;
}

- (ALMainTableItem *)itemAtIndex:(NSInteger)index {
    return [_collectionItems objectAtIndex:index];
}

#pragma mark - Private Methods

- (void)getCollectionItemsWithPage:(NSInteger)page {
    if (![self.interactor checkInternetConnectionAvailability]) {
        [self.view showAlertWithTitle:ALLocalize(@"alert.header") message:ALLocalize(@"alert.noinet")];
        return;
    }
    isLoadingState = YES;
    [_collectionItems removeAllObjects];
    [self.view reloadCollectionView];
    [self.view showShadowViewWithIndicator];
    [self.interactor getCollectionItemsWithPage:page completionHandler:^(id data) {
        if ([self.interactor checkStatusOKFromResponse:data]) {
            [self populateCollectionItemsFromResponse:data];
            [self.view reloadCollectionView];
            isLoadingState = NO;
        }
        [self.view hideShadowViewWithIndicator];
    }];
}

- (void)populateCollectionItemsFromResponse:(id)response {
    if ([response isKindOfClass:[NSArray class]]) {
        NSInteger numberOfElement = 0;
        for (ALMainTableItem *item in response) {
            ALMainTableItemImage *imageItem = [item.images firstObject];
            if (!item.images.count || [imageItem.itemType isEqualToString:@"image/gif"]) {
                continue;
            }
            if (numberOfElement <= 60) {
                [_collectionItems addObject:item];
                
                NSString *path = [imageItem.itemPath stringByDeletingPathExtension];
                NSString *extension = [imageItem.itemPath pathExtension];
                NSString *stringURL = [NSString stringWithFormat:@"%@b.%@", path, extension];
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        imageItem.itemImage = [UIImage imageWithData:imageData];
                        NSInteger index = [_collectionItems indexOfObject:item];
                        NSIndexPath *path = [NSIndexPath indexPathForItem:index inSection:0];
                        [self.view reloadCollectionViewAtIndexPath:path];
                    });
                });
                
                numberOfElement += 1;
            }
            else {
                break;
            }
        }
    }
}

@end
