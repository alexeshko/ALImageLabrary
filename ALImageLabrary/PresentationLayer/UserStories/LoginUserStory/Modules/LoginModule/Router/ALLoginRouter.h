//
//  ALLoginRouter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALLoginRouterInput.h"

@protocol STViperModuleTransitionHandler;

@interface ALLoginRouter : NSObject <ALLoginRouterInput>

@property (nonatomic, weak) id<STViperModuleTransitionHandler> transitionHandler;

@end
