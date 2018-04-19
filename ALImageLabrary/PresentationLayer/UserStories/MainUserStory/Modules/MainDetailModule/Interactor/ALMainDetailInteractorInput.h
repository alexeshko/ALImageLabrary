//
//  ALMainDetailInteractorInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALMainDetailInteractorInput <NSObject>

- (void)getCommentsWithGalleryId:(NSString *)galleryId completionHandler:(void (^)(id data))completion;

- (BOOL)checkStatusOKFromResponse:(id)response;

- (BOOL)checkInternetConnectionAvailability;

@end
