//
//  NSDate+category.m
//  HaiWangXC
//
//  Created by lkx on 14-11-19.
//  Copyright (c) 2014年 cnmobi. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)
/*
 * 将时间转为指定的格式
 * @parameter date          要格式化的时间
 * @parameter formatter     格式化的模式
 */
+ (NSString *)stringWithDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSString *dateStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

/*
 * 将时间时区转为系统时间
 * @parameter oldDate 需要转换的时间
 */
+ (NSDate *)dateWithSystem:(NSDate *)oldDate
{
    NSTimeInterval timeZoneOffset = [[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate *date = [oldDate dateByAddingTimeInterval:timeZoneOffset];
    return date;
}

/*
 * 计算传入的时间与当前的时间差
 * @parameter oldDate 传入的时间
 
 * @return 当时间小于当前时间
 */
+ (NSString *)subTimeWithSystem:(NSDate *)oldDate
{
    NSString *subTimeStr;
    NSDate *nowDate = [NSDate getNowDateFromAnyDate:[NSDate date]];
    NSTimeInterval time = [oldDate timeIntervalSinceDate:nowDate];
    if (time >= 24 * 60 * 60)
    {
        int day = ((int)time) / (24 * 60 * 60);
        int subDay = ((int)time) % (24 * 60 * 60);
        NSString *subDayStr = [self stringWithTimeInterval:subDay];
        subTimeStr = [NSString stringWithFormat:@"%d天 %@", day, subDayStr];
    }
    else if (time < 24 * 60 * 60 && time >= 0)
    {
        subTimeStr = [self stringWithTimeInterval:time];
    }
    else if (time < 0)
    {
        return @"已过期";
    }
    else
    {
        return nil;
    }
    return subTimeStr;
}

/*
 * 将时间戳转化为HH:mm:ss格式
 * 一般用于算倒计时，或者当前时间，不计算超过天以外的时间
 * @parameter timeInterval 时间戳
 * return HH:mm:ss 格式的时间
 */
+ (NSString *)stringWithTimeInterval:(NSInteger)timeInterval
{
    NSString *timeStr;
    int hour = timeInterval / (60*60);
    int minute = timeInterval / 60 % 60;
    int second = timeInterval % 60;
    timeStr = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, minute, second];
    return timeStr;
}

/*
 * 将时间转为当前时区的时间
 * @parameter anyDate 需要转的时间
 */
+ (NSDate *)getNowDateFromAnyDate:(NSDate *)anyDate
{
    NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"]; //UTC
    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
    NSInteger sourceGMToffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMToffset;
    NSDate *destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

/*
 * 返回一个时间，将小时、分钟、秒数以数组返回
 * @parameter timeInterval 秒数,单位是秒
 */
+ (NSArray *)timeArrayWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSString *hourStr;
    NSString *minuteStr;
    NSString *secondStr;
    int timeTl = (int)timeInterval % (24 * 60 * 60);
    int hour = timeTl / (60 * 60);
    int minute = timeTl / 60 % 60;
    int second = timeTl % 60;
    hourStr = [NSString stringWithFormat:@"%02d", hour];
    minuteStr = [NSString stringWithFormat:@"%02d", minute];
    secondStr = [NSString stringWithFormat:@"%02d", second];
    return @[hourStr, minuteStr, secondStr];
}

/*
 * 本程序的时间转化
 */
+ (NSDate *)HWDateWithDateString:(NSString *)dateStr
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"(+)"];
    //json时间单位是毫秒
    NSArray *startArr = [dateStr componentsSeparatedByCharactersInSet:set];
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:[startArr[1] doubleValue]/1000];
    return startDate; //[NSDate getNowDateFromAnyDate:startDate];
}

/*
 * 计算两个时间差
 */
+ (int)deltaTimeWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if (startDate == nil || endDate == nil)
    {
        return 0;
    }
    
    NSTimeInterval startTIl = [startDate timeIntervalSince1970];
    NSTimeInterval endTIl = [endDate timeIntervalSince1970];
    NSTimeInterval subTimeTIl = endTIl - startTIl;
    if (subTimeTIl < 0)
    {
        subTimeTIl = -subTimeTIl;
    }
    
    return (int)subTimeTIl;
}

/*
 * 将字符串转化NSDate
 * 例如: 1991-09-08 转为时间
 */
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

@end
