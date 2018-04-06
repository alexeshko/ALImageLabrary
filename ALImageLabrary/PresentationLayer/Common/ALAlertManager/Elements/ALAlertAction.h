//
//  ALAlertAction.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ALAlertActionHandler)(UIAlertAction *action);

@interface ALAlertAction : NSObject

+ (instancetype)actionWithTitle:(NSString *)title
                          style:(UIAlertActionStyle)style
                        handler:(ALAlertActionHandler)handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIAlertActionStyle style;
@property (nonatomic, readonly) ALAlertActionHandler handler;
@property (nonatomic, getter = isEnabled) BOOL enabled;

@end
