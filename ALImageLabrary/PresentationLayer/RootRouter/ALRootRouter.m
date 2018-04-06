//
//  ALRootRouter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALRootRouter.h"

#import "ALWindowLevel.h"

static id _sharedRouter;

@implementation ALRootRouter

+ (instancetype)sharedRouter {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedRouter = [[self alloc] init];
    });
    return _sharedRouter;
}

- (void)changeRootNavigationController:(UIViewController *)currentController newController:(UIViewController *)newController  {
    [currentController.view removeFromSuperview];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:newController];
    navigation.navigationBar.translucent = NO;
    [navigation.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navigation.navigationBar setShadowImage:[[UIImage alloc] init]];
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    window.rootViewController = navigation;
    
    [self standartAnimationForTransition:window];
}

#pragma mark - Private methods

- (void)standartAnimationForTransition:(UIWindow *)window {
    [UIView transitionWithView:window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];
}

@end
