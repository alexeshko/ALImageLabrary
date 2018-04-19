//
//  ALMainDetailViewInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALMainTableItem;

@protocol ALMainDetailViewInput <NSObject>

- (void)setupInitialStateWithItem:(ALMainTableItem *)item;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

- (void)showShadowViewWithIndicator;
- (void)hideShadowViewWithIndicator;

- (void)reloadTableView;

@end
