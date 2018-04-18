//
//  ALMainViewController.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALMainViewInput.h"
#import "STViperModuleTransitionHandler.h"

@protocol ALMainViewOutput;

@interface ALMainViewController : UIViewController <ALMainViewInput, STViperModuleTransitionHandler>

@property (nonatomic, strong) id<ALMainViewOutput> output;

@end
