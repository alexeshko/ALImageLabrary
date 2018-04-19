//
//  ALMainDetailAssembly.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALMainDetailModuleInput;

@interface ALMainDetailAssembly : NSObject

+ (UIViewController *)createModuleWithConfiguration:(void(^)(id<ALMainDetailModuleInput> input))configuration;

@end
