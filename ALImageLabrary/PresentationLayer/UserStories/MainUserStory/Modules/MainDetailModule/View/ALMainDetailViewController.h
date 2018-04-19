//
//  ALMainDetailViewController.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALMainDetailViewInput.h"
#import "ALViperModuleTransitionHandler.h"

@protocol ALMainDetailViewOutput;

@interface ALMainDetailViewController : UIViewController <ALMainDetailViewInput, ALViperModuleTransitionHandler>

@property (nonatomic, strong) id<ALMainDetailViewOutput> output;

@end
