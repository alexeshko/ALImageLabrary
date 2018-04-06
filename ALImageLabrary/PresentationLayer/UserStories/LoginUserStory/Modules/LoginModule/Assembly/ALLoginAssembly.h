//
//  ALLoginAssembly.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALLoginModuleInput;

@interface ALLoginAssembly : NSObject

+ (UIViewController *)createModuleWithConfiguration:(void(^)(id<ALLoginModuleInput> input))configuration;

@end
