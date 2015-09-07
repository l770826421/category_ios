//
//  NSDate+category.h
//  HaiWangXC
//
//  Created by lkx on 14-11-19.
//  Copyright (c) 2014年 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (category)
/*
 * 将时间转为指定的格式
 * @parameter date          要格式化的时间
 * @parameter formatter     格式化的模式
 */
+ (NSString *)stringWithDate:(NSDate *)date formatter:(NSString *)formatter;

/*
 * 将时间时区转为系统时间
 * @parameter oldDate 需要转换的时间
 */
+ (NSDate *)dateWithSystem:(NSDate *)oldDate;

/*
 * 计算传入的时间与当前的时间差
 * @parameter oldDate 传入的时间
 
 * @return 当时间小于当前时间
 */
+ (NSString *)subTimeWithSystem:(NSDate *)oldDate;

/*
 * 将时间戳转化为HH:mm:ss格式
 * 一般用于算倒计时，或者当前时间，不计算超过天以外的时间
 * @parameter timeInterval 时间戳
 * return HH:mm:ss 格式的时间
 */
+ (NSString *)stringWithTimeInterval:(NSInteger)timeInterval;

/*
 * 将时间转为当前时区的时间
 * @parameter anyDate 需要转的时间
 */
+ (NSDate *)getNowDateFromAnyDate:(NSDate *)anyDate;

/*
 * 返回一个时间，将小时、分钟、秒数以数组返回
 * @parameter timeInterval 秒数,单位是秒
 */
+ (NSArray *)timeArrayWithTimeInterval:(NSTimeInterval)timeInterval;

/*
 * 本程序的时间转化
 */
+ (NSDate *)HWDateWithDateString:(NSString *)dateStr;

/*
 * 计算两个时间差
 */
+ (int)deltaTimeWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/*
 * 将字符串转化NSDate
 * 例如: 1991-09-08 转为时间
 */
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(NSString *)formatter;

@end
