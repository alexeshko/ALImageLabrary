//
//  ALLoginRouter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginRouter.h"

#import "ALViperModuleTransitionHandler.h"

#import "ALMainAssembly.h"
#import "ALMainModuleInput.h"

@implementation ALLoginRouter

#pragma mark - ALLoginRouterInput

- (void)openMainModuleWithCurrentIP:(NSString *)currentIP {
    UIViewController *controller = [ALMainAssembly createModuleWithConfiguration:^(id<ALMainModuleInput> input) {
        [input configureWithCurrentIP:currentIP];
    }];
    [self.transitionHandler openModuleController:controller animated:YES];
}

@end
