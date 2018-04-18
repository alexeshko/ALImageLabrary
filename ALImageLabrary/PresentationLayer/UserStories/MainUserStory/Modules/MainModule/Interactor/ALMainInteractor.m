//
//  ALMainInteractor.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainInteractor.h"

#import "ALServerFactory.h"
#import "ALConnectionService.h"

@implementation ALMainInteractor

#pragma mark - ALMainInteractorInput

- (void)getCollectionItemsWithPage:(NSInteger)page completionHandler:(void (^)(id data))completion {
    [[ALServerFactory sharedFactory] requestCollectionItemsWithPage:page completionHandler:completion];
}

- (BOOL)checkStatusOKFromResponse:(id)response {
    return YES; //[[ALServerFactory sharedFactory] getResponseStatusOKWithData:response];
}

- (BOOL)checkInternetConnectionAvailability {
    return [[ALConnectionService sharedService] checkInternetConnection];
}

@end
