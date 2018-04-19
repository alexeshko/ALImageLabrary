//
//  ALLoginViewInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALLoginViewInput <NSObject>

- (void)setupInitialState;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
