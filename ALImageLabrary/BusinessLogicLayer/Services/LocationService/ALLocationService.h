//
//  ALLocationService.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ALLocationService : NSObject <CLLocationManagerDelegate>

+ (instancetype)sharedService;

- (BOOL)getLocationPermissions;
- (void)getUserLocation;
- (NSDictionary *)getUserLocationInfo;
- (void)getUserLocationByIP;

- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

@end
