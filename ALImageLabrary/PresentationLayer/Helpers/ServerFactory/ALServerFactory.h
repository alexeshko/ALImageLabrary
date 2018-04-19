//
//  ALServerFactory.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALServerFactory : NSObject

+ (instancetype)sharedFactory;

- (void)requestCollectionItemsWithPage:(NSInteger)page completionHandler:(void (^)(id data))completion;
- (void)requestCommentsWithGalleryId:(NSString *)galleryId completionHandler:(void (^)(id data))completion;
- (void)requestUserCurrentLocationWithCompletionHandler:(void (^)(id data))completion;

- (BOOL)getResponseStatusOKWithData:(id)responseData;

@end
