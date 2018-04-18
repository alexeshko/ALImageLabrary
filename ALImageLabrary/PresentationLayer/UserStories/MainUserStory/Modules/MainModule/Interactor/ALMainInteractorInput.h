//
//  ALMainInteractorInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALMainInteractorInput <NSObject>

- (void)getCollectionItemsWithPage:(NSInteger)page completionHandler:(void (^)(id data))completion;

- (BOOL)checkStatusOKFromResponse:(id)response;

- (BOOL)checkInternetConnectionAvailability;

@end
