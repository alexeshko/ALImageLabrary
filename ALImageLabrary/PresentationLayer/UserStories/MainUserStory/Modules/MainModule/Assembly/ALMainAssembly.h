//
//  ALMainAssembly.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALMainModuleInput;

@interface ALMainAssembly : NSObject

+ (UIViewController *)createModuleWithConfiguration:(void(^)(id<ALMainModuleInput> input))configuration;

@end
