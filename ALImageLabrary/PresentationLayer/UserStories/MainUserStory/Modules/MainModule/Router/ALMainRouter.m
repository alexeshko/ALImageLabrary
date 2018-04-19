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

- (void)openMainDetailModuleWithItem:(ALMainTableItem *)item {
    NSLog(@"%@", item);
}

@end
