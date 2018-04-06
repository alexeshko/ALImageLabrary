//
//  ALAlertDescription.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UITextField;

typedef  void (^ALTextFieldConfigurationHandler)(UITextField *textField);

@interface ALAlertDescription : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray *actions;
@property (nonatomic, copy) NSArray *textFieldsConfigurationHandlers;

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message;

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions;

+ (instancetype)alertDescriptionWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions
          textFieldsConfigurationHandlers:(NSArray *)textFieldsConfigurationHandlers;

@end

