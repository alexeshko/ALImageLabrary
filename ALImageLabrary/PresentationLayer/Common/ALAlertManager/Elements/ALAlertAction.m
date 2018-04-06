//
//  ALAlertAction.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALAlertAction.h"

@implementation ALAlertAction

+ (instancetype)actionWithTitle:(NSString *)title
                          style:(UIAlertActionStyle)style
                        handler:(ALAlertActionHandler)handler {
    
    return [[self alloc] initWithTitle:title
                                 style:style
                               handler:handler];
}

- (instancetype)initWithTitle:(NSString *)title
                        style:(UIAlertActionStyle)style
                      handler:(ALAlertActionHandler)handler {
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
        _handler = handler;
        _enabled = YES;
    }
    return self;
}

@end
