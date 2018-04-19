//
//  ALLoginInteractor.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginInteractor.h"

#import "ALConnectionService.h"

@implementation ALLoginInteractor

#pragma mark - ALLoginInteractorInput

- (BOOL)checkUserForJoin {
    // Handle check join
    return YES;
}

- (BOOL)checkInternetConnectionAvailability {
    return [[ALConnectionService sharedService] checkInternetConnection];
}

@end
