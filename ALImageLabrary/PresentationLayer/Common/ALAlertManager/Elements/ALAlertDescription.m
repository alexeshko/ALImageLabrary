//
//  ALAlertDescription.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALAlertDescription.h"

@implementation ALAlertDescription

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message {
    
    return [[self class] alertDescriptionWithTitle:title
                                           message:message
                                           actions:nil];
}

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions {
    
    return [[self class] alertDescriptionWithTitle:title
                                           message:message
                                           actions:actions
                   textFieldsConfigurationHandlers:nil];
}

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions
          textFieldsConfigurationHandlers:(NSArray *)textFieldsConfigurationHandlers {
    
    ALAlertDescription *description = [[ALAlertDescription alloc] init];
    description.title = title;
    description.message = message;
    description.actions = actions;
    description.textFieldsConfigurationHandlers = textFieldsConfigurationHandlers;
    return description;
}

@end
