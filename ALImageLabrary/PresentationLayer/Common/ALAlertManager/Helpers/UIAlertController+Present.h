//
//  UIAlertController+Present.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Present)

@property (nonatomic, strong) UIWindow *contextWindow;

- (void)presentInContextWindow;

@end
