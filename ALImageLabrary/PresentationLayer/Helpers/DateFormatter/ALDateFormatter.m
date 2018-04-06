//
//  ALDateFormatter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALDateFormatter.h"

@implementation ALDateFormatter

#pragma mark - Public methods

+ (NSString *)getStringDateWithFormat:(NSInteger)format date:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self settingsForDateFormatter:[self dateFormatForType:format]];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)getDateFromStringWithFormat:(NSInteger)format string:(NSString *)string {
    NSDateFormatter *dateFormatter = [self settingsForDateFormatter:[self dateFormatForType:format]];
    return [dateFormatter dateFromString:string];
}

#pragma mark - Private methods

+ (NSString *)dateFormatForType:(NSInteger)type {
    static NSDictionary * _dateFormatTypes = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _dateFormatTypes = @{
                             @(ALLongDate) : @"d/MMMM/yyyy HH:mm:ss",
                             @(ALShortDate) : @"d/MMMM/yyyy",
                             @(ALYearDate) : @"yyyy",
                             @(ALMonthDate) : @"MMMM",
                             @(ALDayDate) : @"d",
                             @(ALTimeDate) : @"HH:mm:ss"
                             };
    });
    NSString * dateFormat = [_dateFormatTypes objectForKey:@(type)];
    
    return (dateFormat) ? dateFormat : @"d/MMMM/yyyy HH:mm:ss";
}

+ (NSDateFormatter *)settingsForDateFormatter:(NSString *)format {
    NSString *deviceLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:deviceLanguage];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:locale];
    
    return dateFormatter;
}

@end
