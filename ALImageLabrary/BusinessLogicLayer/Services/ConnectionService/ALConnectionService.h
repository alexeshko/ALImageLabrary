//
//  ALConnectionService.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALConnectionService : NSObject

+ (instancetype)sharedService;

- (void)startMonitoringNetwork;

- (BOOL)checkInternetConnection;

@end
