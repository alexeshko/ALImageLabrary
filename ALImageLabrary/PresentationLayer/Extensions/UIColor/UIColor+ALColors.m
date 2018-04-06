//
//  UIColor+ALColors.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "UIColor+ALColors.h"

@implementation UIColor (ALColors)

+ (UIColor *)colorFromHex:(NSInteger)hex {
    return [self colorFromHex:hex alpha:1.f];
}

+ (UIColor *)colorFromHex:(NSInteger)hex alpha:(CGFloat)alpha {
    return [self colorWithRed:((hex & 0xFF0000) >> 16)/255.f
                        green:((hex & 0x00FF00) >> 8) /255.f
                         blue:( hex & 0x0000FF)       /255.f
                        alpha:alpha];
}

+ (UIColor *)alMainColorElement {
    return [UIColor colorFromHex:0x00C8FC];
}

@end
