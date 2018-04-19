//
//  ALMainTableItemImage.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18.04.18.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALMainTableItemImage : NSObject

@property(strong, nonatomic) NSString *itemId;
@property(strong, nonatomic) NSString *itemType;
@property(strong, nonatomic) NSString *itemPath;
@property(strong, nonatomic) NSString *itemTitle;
@property(strong, nonatomic) NSString *itemDescription;
@property(strong, nonatomic) NSString *itemDate;
@property(strong, nonatomic) NSString *itemViews;

@property(strong, nonatomic) UIImage *itemImage;

@end
