//
//  ALView.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 ALView
 
 Base class for UIViewController' view in application (in the main purpose).
 Also it define additional lifecycle method(s).
 */
@interface ALView : UIView

/**
 Lifecycle method for view constraints creation called on final step of view initialization.
 Should never be called directly. Must be overridden for create subviews constraints if needed.
 */
- (void)makeConstraints;

@end
