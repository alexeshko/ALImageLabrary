//
//  ALAlertManager.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALAlertAction.h"
#import "ALAlertDescription.h"

@interface ALAlertManager : NSObject

+ (instancetype)sharedManager;

- (void)showAlertWithMessage:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
             cancelHandler:(ALAlertActionHandler)handler;

- (void)showAlertWithDescription:(ALAlertDescription *)description;

@end
