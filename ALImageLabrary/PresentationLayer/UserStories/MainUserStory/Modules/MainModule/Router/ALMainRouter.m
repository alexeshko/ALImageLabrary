//
//  ALMainRouter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainRouter.h"

#import "ALViperModuleTransitionHandler.h"

@implementation ALMainRouter

#pragma mark - ALMainRouterInput

- (void)closeMainModule {
    [self.transitionHandler closeCurrentModuleAnimated:YES];
}

- (void)openMainDetailModule {
    // TODO
}

@end
