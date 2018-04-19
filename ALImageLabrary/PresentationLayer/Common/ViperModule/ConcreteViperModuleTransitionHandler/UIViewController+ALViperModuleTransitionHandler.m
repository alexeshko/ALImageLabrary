//
//  UIViewController+ALViperModuleTransitionHandler.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "UIViewController+ALViperModuleTransitionHandler.h"

@implementation UIViewController (ALViperModuleTransitionHandler)

- (void)openModuleController:(UIViewController *)controller animated:(BOOL)animated {
    UIViewController *viewController = [self safeViewController:controller];
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)presentModuleController:(UIViewController *)controller animated:(BOOL)animated {
    UIViewController *viewController = [self safeViewController:controller];
    [self.navigationController presentViewController:viewController
                                            animated:animated
                                          completion:nil];
}

- (void)openSubmoduleController:(UIViewController *)controller inContainerView:(UIView *)containerView {
    UIViewController *viewController = [self safeViewController:controller];
    [self addChildViewController:viewController];
    [containerView addSubview:viewController.view];
    [self makeStretchConstraintOfView:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)closeCurrentModuleAnimated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:animated];
    }
    else if (self.beingPresented) {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
}

- (void)closeAllModulesUntilRootModuleAnimated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)closeCurrentSubmodule {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

#pragma mark - Private Methods

- (UIViewController *)safeViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController *)viewController).topViewController ?: viewController;
    }
    return viewController;
}

- (void)makeStretchConstraintOfView:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view.topAnchor constraintEqualToAnchor:view.superview.topAnchor].active = YES;
    [view.leftAnchor constraintEqualToAnchor:view.superview.leftAnchor].active = YES;
    [view.rightAnchor constraintEqualToAnchor:view.superview.rightAnchor].active = YES;
    [view.bottomAnchor constraintEqualToAnchor:view.superview.bottomAnchor].active = YES;
}

@end
