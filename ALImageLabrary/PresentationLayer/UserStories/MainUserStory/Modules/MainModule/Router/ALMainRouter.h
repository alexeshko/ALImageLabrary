//
//  ALMainRouter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALMainRouterInput.h"

@protocol ALViperModuleTransitionHandler;

@interface ALMainRouter : NSObject <ALMainRouterInput>

@property (nonatomic, weak) id<ALViperModuleTransitionHandler> transitionHandler;

@end
