//
//  ALMainDetailInteractor.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailInteractor.h"

#import "ALServerFactory.h"
#import "ALConnectionService.h"

@implementation ALMainDetailInteractor

#pragma mark - ALMainDetailInteractorInput

- (void)getCommentsWithGalleryId:(NSString *)galleryId completionHandler:(void (^)(id data))completion {
    [[ALServerFactory sharedFactory] requestCommentsWithGalleryId:galleryId completionHandler:completion];
}

- (BOOL)checkStatusOKFromResponse:(id)response {
    return YES; //[[ALServerFactory sharedFactory] getResponseStatusOKWithData:response];
}

- (BOOL)checkInternetConnectionAvailability {
    return [[ALConnectionService sharedService] checkInternetConnection];
}

@end
