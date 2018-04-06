//
//  ALConnectionService.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALConnectionService.h"

#import <RestKit/RestKit.h>

static id _sharedService;

@interface ALConnectionService () {
    BOOL _isInternetOn;
}
@end

@implementation ALConnectionService

+ (instancetype)sharedService {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedService = [[self alloc] init];
    });
    return _sharedService;
}

- (void)startMonitoringNetwork {
    [[RKObjectManager sharedManager].HTTPClient setReachabilityStatusChangeBlock:^(AFRKNetworkReachabilityStatus status) {
        _isInternetOn = (status != AFRKNetworkReachabilityStatusNotReachable && status != AFRKNetworkReachabilityStatusUnknown);
    }];
}

- (BOOL)checkInternetConnection {
    return _isInternetOn;
}

@end
