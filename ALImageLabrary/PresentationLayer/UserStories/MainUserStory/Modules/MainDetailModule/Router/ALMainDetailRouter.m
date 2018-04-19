//
//  ALMainDetailRouter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailRouter.h"

#import "ALViperModuleTransitionHandler.h"

@implementation ALMainDetailRouter

#pragma mark - ALMainDetailRouterInput

- (void)closeMainDetailModule {
    [self.transitionHandler closeCurrentModuleAnimated:YES];
}

- (void)openLoginModule {
    [self.transitionHandler closeAllModulesUntilRootModuleAnimated:YES];
}

@end
