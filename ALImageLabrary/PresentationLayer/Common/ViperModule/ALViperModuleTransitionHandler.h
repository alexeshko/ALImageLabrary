//
//  ALViperModuleTransitionHandler.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALViperModuleTransitionHandler <NSObject>

// Push behavior of transition
- (void)openModuleController:(UIViewController *)controller
                    animated:(BOOL)animated;

// Present behavior of transition
- (void)presentModuleController:(UIViewController *)controller
                       animated:(BOOL)animated;

// Simple adding as subview
- (void)openSubmoduleController:(UIViewController *)controller
                inContainerView:(UIView *)containerView;

// Closed current module
- (void)closeCurrentModuleAnimated:(BOOL)animated;

// Closed all modules until root module
- (void)closeAllModulesUntilRootModuleAnimated:(BOOL)animated;

// If current module open as submodule
- (void)closeCurrentSubmodule;

@end
