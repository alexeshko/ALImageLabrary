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

- (void)didTouchQuitButton {
    [self.router closeMainModule];
}

- (void)didTouchBackButton {
    if (_currentPage > 0) {
        _currentPage -= 1;
        [self getCollectionItemsWithPage:_currentPage];
    }
}

- (void)didTouchNextButton {
    _currentPage += 1;
    [self getCollectionItemsWithPage:_currentPage];
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
    [self.interactor getCollectionItemsWithPage:page completionHandler:^(id data) {
        if ([self.interactor checkStatusOKFromResponse:data]) {
            [self populateCollectionItemsFromResponse:data];
            [self.view changeNavigationTitleWithPage:page];
            [self.view reloadCollectionView];
        }
    }];
}

- (void)populateCollectionItemsFromResponse:(id)response {
    if ([response isKindOfClass:[NSArray class]]) {
        [_collectionItems removeAllObjects];
        NSInteger numberOfElement = 0;
        for (ALMainTableItem *item in response) {
            ALMainTableItemImage *itemImage = [item.images firstObject];
            if (!item.images.count || [itemImage.itemType isEqualToString:@"image/gif"]) {
                continue;
            }
            if (numberOfElement <= 30) {
                [_collectionItems addObject:item];
                numberOfElement += 1;
            }
            else {
                break;
            }
        }
    }
}

@end
