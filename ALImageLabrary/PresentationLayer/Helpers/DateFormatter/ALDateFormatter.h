//
//  ALDateFormatter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ALFormatDate) {
    ALLongDate,
    ALShortDate,
    ALYearDate,
    ALMonthDate,
    ALDayDate,
    ALTimeDate
};

@interface ALDateFormatter : NSObject

+ (NSString *)getStringDateWithFormat:(NSInteger)format date:(NSDate *)date;
+ (NSDate *)getDateFromStringWithFormat:(NSInteger)format string:(NSString *)string;

@end
