//
//  ALLoginViewController.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALLoginViewInput.h"
#import "ALViperModuleTransitionHandler.h"

@protocol ALLoginViewOutput;

@interface ALLoginViewController : UIViewController <ALLoginViewInput, ALViperModuleTransitionHandler>

@property (nonatomic, strong) id<ALLoginViewOutput> output;

@end
