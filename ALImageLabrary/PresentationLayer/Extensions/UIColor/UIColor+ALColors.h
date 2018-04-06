//
//  UIColor+ALColors.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (ALColors)

+ (UIColor *)colorFromHex:(NSInteger)hex;
+ (UIColor *)colorFromHex:(NSInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)alMainColorElement;

@end
