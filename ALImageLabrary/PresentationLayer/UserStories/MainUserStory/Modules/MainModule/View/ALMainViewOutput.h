//
//  ALMainViewOutput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALMainTableItem;

@protocol ALMainViewOutput <NSObject>

- (void)viewDidLoad;

- (void)didTouchBackButton;
- (void)didTouchNextButton;

- (void)didTouchCollectionItemWithIndex:(NSInteger)index;

- (NSInteger)numberOfRowsInSection;
- (ALMainTableItem *)itemAtIndex:(NSInteger)index;

@end
