//
//  ALServerFactory.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALServerFactory.h"

#import "ALAlertManager.h"

#import <RestKit/RestKit.h>

static id _sharedFactory;

@implementation ALServerFactory

+ (instancetype)sharedFactory {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedFactory = [[self alloc] init];
    });
    return _sharedFactory;
}

- (id)init {
    self = [super init];
    if (self) {
        AFRKHTTPClient *client = [[AFRKHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:ALServerBaseURL]];
        [RKObjectManager setSharedManager:[[RKObjectManager alloc] initWithHTTPClient:client]];
    }
    return self;
}

- (void)requestUserCurrentLocationWithCompletionHandler:(void (^)(id data))completion {
    AFRKHTTPClient* client = [AFRKHTTPClient clientWithBaseURL:[NSURL URLWithString:ALServerServiceURLForIPApi]];
    [client getPath:ALServerPathPattern parameters:nil success:^(AFRKHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(AFRKHTTPRequestOperation *operation, NSError *error) {
        // Error getting location by IP
    }];
}

- (BOOL)getResponseStatusOKWithData:(id)responseData {
    BOOL returnValue = NO;
    NSString *statusCode = [self getResponseStatusCodeWithData:responseData];
    if (statusCode) {
        if ([statusCode isEqualToString:ALServerCode200OK]) {
            returnValue = YES;
        }
        else if ([statusCode isEqualToString:ALServerCode400Bad]) {
            [[ALAlertManager sharedManager] showAlertWithTitle:ALLocalize(@"alert.header") message:[responseData valueForKey:@"message"]];
        }
        else if ([responseData isKindOfClass:[NSError class]]) {
            NSError *errorMessage = (NSError *)responseData;
            [[ALAlertManager sharedManager] showAlertWithTitle:ALLocalize(@"alert.header") message:errorMessage.localizedDescription];
        }
    }
    return returnValue;
}

- (NSString *)getResponseStatusCodeWithData:(id)responseData {
    NSString *statusCode;
    if ([responseData isKindOfClass:[NSData class]]) {
        NSError *error;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:responseData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&error];
        responseData = jsonData;
    }
    if ([responseData isKindOfClass:[NSArray class]]) {
        NSArray *responseArray = (NSArray *)responseData;
        if (responseArray.count) {
            responseData = responseArray[0];
        }
    }
    if ([responseData isKindOfClass:[NSDictionary class]]) {
        statusCode = [responseData valueForKey:@"Status"];
    }
    else if ([responseData isKindOfClass:[NSError class]]) {
        statusCode = ALServerCodeError;
    }
    return statusCode;
}

#pragma mark - Provate methods

- (void)simpleRequestWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(id data))completion {
    [[RKObjectManager sharedManager].HTTPClient getPath:ALServerPathPattern
                                             parameters:parameters
                                                success:^(AFRKHTTPRequestOperation *operation, id responseObject) {
                                                    if (completion) {
                                                        completion(responseObject);
                                                    }
                                                } failure:^(AFRKHTTPRequestOperation *operation, NSError *error) {
                                                    if (completion) {
                                                        completion(error);
                                                    }
                                                }];
}

@end
