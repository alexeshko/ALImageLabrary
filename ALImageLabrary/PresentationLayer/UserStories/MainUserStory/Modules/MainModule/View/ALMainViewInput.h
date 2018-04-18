//
//  ALMainViewInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALMainViewInput <NSObject>

- (void)setupInitialState;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

- (void)reloadCollectionView;

- (void)changeNavigationTitleWithPage:(NSInteger)page;

@end
