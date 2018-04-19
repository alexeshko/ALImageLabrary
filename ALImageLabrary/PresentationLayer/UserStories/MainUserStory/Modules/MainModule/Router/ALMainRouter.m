//
//  ALMainRouter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainRouter.h"

#import "ALViperModuleTransitionHandler.h"

#import "ALMainDetailAssembly.h"
#import "ALMainDetailModuleInput.h"

@implementation ALMainRouter

#pragma mark - ALMainRouterInput

- (void)openMainDetailModuleWithItem:(ALMainTableItem *)item {
    UIViewController *controller = [ALMainDetailAssembly createModuleWithConfiguration:^(id<ALMainDetailModuleInput> input) {
        [input configureWithItem:item];
    }];
    [self.transitionHandler openModuleController:controller animated:YES];
}

@end
