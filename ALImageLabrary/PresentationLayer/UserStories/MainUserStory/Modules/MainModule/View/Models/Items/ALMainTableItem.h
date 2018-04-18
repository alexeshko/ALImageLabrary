//
//  ALMainTableItem.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18.04.18.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALMainTableItemImage;

@interface ALMainTableItem : NSObject

@property(strong, nonatomic) NSString *itemCoverId;
@property(strong, nonatomic) NSString *itemAuthor;

@property(strong, nonatomic) NSArray<ALMainTableItemImage *> *images;

@end
