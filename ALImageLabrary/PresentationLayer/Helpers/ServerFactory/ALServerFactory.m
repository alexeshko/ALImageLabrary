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

#import "ALMainTableItem.h"
#import "ALMainTableItemImage.h"

static id _sharedFactory;

@interface ALServerFactory () {
    RKResponseDescriptor *_responseDescriptor;
}

@end

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
        [client setDefaultHeader:ALServerAuthorization value:ALServerAuthorizationClientID];
        [RKObjectManager setSharedManager:[[RKObjectManager alloc] initWithHTTPClient:client]];
    }
    return self;
}

- (void)requestCollectionItemsWithPage:(NSInteger)page completionHandler:(void (^)(id data))completion {
    RKObjectMapping *collectionItemMapping = [RKObjectMapping mappingForClass:[ALMainTableItem class]];
    [collectionItemMapping addAttributeMappingsFromDictionary:@{
                                                                @"cover" : @"itemCoverId",
                                                                @"account_url" : @"itemAuthor"
                                                                }];
    
    RKObjectMapping *collectionItemImageMapping = [RKObjectMapping mappingForClass:[ALMainTableItemImage class]];
    [collectionItemImageMapping addAttributeMappingsFromDictionary:@{
                                                                     @"id" : @"itemId",
                                                                     @"type" : @"itemType",
                                                                     @"link" : @"itemPath",
                                                                     @"title" : @"itemTitle",
                                                                     @"description" : @"itemDescription",
                                                                     @"datetime" : @"itemDate",
                                                                     @"views" : @"itemViews"
                                                                     }];
    
    [collectionItemMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"images" toKeyPath:@"images" withMapping:collectionItemImageMapping]];
    
    _responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:collectionItemMapping method:RKRequestMethodGET pathPattern:ALServerGalleryPath keyPath:@"data" statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    NSDictionary *serverParameters = @{@"page" : @(page)};
    
    [self sendAndHandleMappingRequestWithPathPattern:ALServerGalleryPath
                                          parameters:serverParameters
                                   completionHandler:completion];
}

- (void)requestUserCurrentLocationWithCompletionHandler:(void (^)(id data))completion {
    AFRKHTTPClient* client = [AFRKHTTPClient clientWithBaseURL:[NSURL URLWithString:ALServerServiceURLForIPApi]];
    [client getPath:ALServerLocationPath parameters:nil success:^(AFRKHTTPRequestOperation *operation, id responseObject) {
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

#pragma mark - Provate methods

- (void)simpleRequestWithPathPattern:(NSString *)pathPattern
                          parameters:(NSDictionary *)parameters
                   completionHandler:(void (^)(id data))completion {
    [[RKObjectManager sharedManager].HTTPClient getPath:pathPattern
                                             parameters:parameters
                                                success:^(AFRKHTTPRequestOperation *operation, id responseObject) {
                                                    if (completion) {
                                                        NSDictionary *jsonData = [self convertResponseToDictionary:responseObject];
                                                        completion(jsonData);
                                                    }
                                                } failure:^(AFRKHTTPRequestOperation *operation, NSError *error) {
                                                    if (completion) {
                                                        completion(error);
                                                    }
                                                }];
}

- (void)mappingRequestWithPathPattern:(NSString *)pathPattern
                           parameters:(NSDictionary *)parameters
                    completionHandler:(void (^)(id data))completion {
    [[RKObjectManager sharedManager] getObjectsAtPath:pathPattern
                                           parameters:parameters
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  if (completion) {
                                                      completion(mappingResult.array);
                                                  }
                                              } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  if (completion) {
                                                      completion(error);
                                                  }
                                              }];
}

- (void)sendAndHandleMappingRequestWithPathPattern:(NSString *)pathPattern
                                        parameters:(NSDictionary *)parameters
                                 completionHandler:(void (^)(id data))completion {
    
    [[RKObjectManager sharedManager] addResponseDescriptor:_responseDescriptor];
    [self mappingRequestWithPathPattern:pathPattern parameters:parameters completionHandler:^(id data) {
        [[RKObjectManager sharedManager] removeResponseDescriptor:_responseDescriptor];
        completion(data);
    }];
}

- (NSString *)getResponseStatusCodeWithData:(id)responseData {
    NSString *statusCode;
    if ([responseData isKindOfClass:[NSDictionary class]]) {
        statusCode = [responseData valueForKey:@"Status"];
    }
    else if ([responseData isKindOfClass:[NSError class]]) {
        statusCode = ALServerCodeError;
    }
    return statusCode;
}

- (NSDictionary *)convertResponseToDictionary:(id)response {
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:response
                                           options:NSJSONReadingMutableContainers
                                             error:&error];
}

@end
