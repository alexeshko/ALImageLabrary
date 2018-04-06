//
//  ALLocationService.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLocationService.h"

#import "ALServerFactory.h"

static id _sharedService;

@interface ALLocationService () {
    CLLocationManager *_locationManager;
    NSMutableDictionary *_userLocation;
}

@end

@implementation ALLocationService

+ (instancetype)sharedService {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedService = [[self alloc] initLocationService];
    });
    return _sharedService;
}

- (BOOL)getLocationPermissions {
    BOOL returnValue = YES;
    NSInteger status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
    else if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        returnValue = NO;
    }
    if (!returnValue) {
        [self getUserLocationByIP];
    }
    return returnValue;
}

- (void)getUserLocation {
    [_locationManager requestLocation];
}

- (NSDictionary *)getUserLocationInfo {
    return _userLocation;
}

- (void)startUpdatingLocation {
    if ([self getLocationPermissions]) {
        [_locationManager startUpdatingLocation];
    }
}

- (void)stopUpdatingLocation {
    [_locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *currentLocation = [locations lastObject];
    [_userLocation setObject:@(currentLocation.coordinate.latitude) forKey:@"latitude"];
    [_userLocation setObject:@(currentLocation.coordinate.longitude) forKey:@"longitude"];
    [_locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    //Required method for CLLocationManagerDelegate
}

#pragma mark - Private methods

- (instancetype)initLocationService {
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _userLocation = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)getUserLocationByIP {
    [[ALServerFactory sharedFactory] requestUserCurrentLocationWithCompletionHandler:^(id data) {
        if ([data isKindOfClass:[NSData class]]) {
            NSError *error;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&error];
            [_userLocation setObject:[jsonData valueForKey:@"city"] forKey:@"city"];
            [_userLocation setObject:[jsonData valueForKey:@"query"] forKey:@"ip"];
            [_userLocation setObject:[jsonData valueForKey:@"lon"] forKey:@"longitude"];
            [_userLocation setObject:[jsonData valueForKey:@"lon"] forKey:@"longitude"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:ALLoginUserLocation object:nil userInfo:_userLocation];
        }
    }];
}

@end
