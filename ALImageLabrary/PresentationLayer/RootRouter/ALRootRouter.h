//
//  ALRootRouter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALRootRouter : NSObject

+ (instancetype)sharedRouter;

- (void)changeRootNavigationController:(UIViewController *)currentController newController:(UIViewController *)newController;

@end
