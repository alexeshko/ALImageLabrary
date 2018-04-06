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

- (void)requestUserCurrentLocationWithCompletionHandler:(void (^)(id data))completion;

- (BOOL)getResponseStatusOKWithData:(id)responseData;
- (NSString *)getResponseStatusCodeWithData:(id)responseData;

@end
