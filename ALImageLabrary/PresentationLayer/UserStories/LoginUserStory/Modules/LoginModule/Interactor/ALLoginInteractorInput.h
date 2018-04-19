//
//  ALLoginInteractorInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALLoginInteractorInput <NSObject>

- (BOOL)checkUserForJoin;

- (BOOL)checkInternetConnectionAvailability;

@end
