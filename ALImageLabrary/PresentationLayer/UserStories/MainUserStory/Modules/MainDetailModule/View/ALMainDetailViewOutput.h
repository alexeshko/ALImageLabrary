//
//  ALMainDetailViewOutput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALMainDetailTableItem;

@protocol ALMainDetailViewOutput <NSObject>

- (void)viewDidLoad;

- (void)didTouchBackButton;
- (void)didTouchExitButton;

- (NSInteger)numberOfRowsInSection;
- (ALMainDetailTableItem *)itemAtIndex:(NSInteger)index;

@end
