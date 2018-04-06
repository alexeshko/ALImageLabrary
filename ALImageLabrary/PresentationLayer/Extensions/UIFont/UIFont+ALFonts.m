//
//  UIFont+ALFonts.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "UIFont+ALFonts.h"

@implementation UIFont (ALFonts)

+ (UIFont *)alHelveticaNeueThinWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}

+ (UIFont *)alHelveticaNeueRegularWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Regular" size:size];
}

+ (UIFont *)alHelveticaNeueMediumWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

+ (UIFont *)alHelveticaNeueBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont *)alHelveticaNeueLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

@end
