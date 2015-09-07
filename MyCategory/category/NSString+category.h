//
//  NSString+category.h
//  HaiWangXC
//
//  Created by lkx on 14-11-24.
//  Copyright (c) 2014年 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (category)

/*
 * 获取手机的UUID
 */
+ (NSString *)uuid;

/*
 * 将字符串中得某些字符或字符串设置不同字体颜色
 * 此方法是将第一个字符设置为黑色，其他字符为红色
 * @parameter str 需要设置的字符串
 *
 * @return 返回类型为NSAttributedString
 */
+ (NSAttributedString *)attributedText:(NSString *)str;

/*
 * 将两个字符串拼接在一起,但是两个字符串的字体颜色不一样
 * @parameter text1 字符串1
 * @parameter color1 字符串1的字体颜色
 * @parameter text2 字符串2
 * @parameter color2 字符串2的字体颜色
 * @parameter splitStr 连个字符串之间的连接符,长度为3,分别是拼接后的前缀、两个字符串连接符、后缀
 */
+ (NSAttributedString *)attributedText1:(NSString *)text1 color1:(UIColor *)color1 text2:(NSString *)text2 color2:(UIColor *)color2 split:(NSArray *)splitArray;

/*
 * 获取attributedString的属性字典
 * @parameter str 需要获取attributedString的字符串
 *
 * @return 返回类型为NSDictionary
 */
+ (NSDictionary *)attributedDic:(NSString *)str;


/*
 * 判断字符串是不是数字字符串
 * @parameter str 要判断的字符串
 */
+ (BOOL)isNumString:(NSString *)str;

/*
 * 去除字符串最后的字符串
 * @parameter string 要去除的字符串
 * @parameter suffixStr 去除的字符串
 */
+ (NSString *)subSuffixStr:(NSMutableString *)string suffixString:(NSString *)suffixStr;

/*
 * 将手机号中间四位置为*
 * 例如: 15845689541 -> 158****9541
 * @parameter phoneString 手机号码
 */
+ (NSString *)phoneChangeWithStar:(NSString *)phoneString;

/*
 * 绝对值
 */
+ (int)absoluteValue:(int)number;

/*
 * 获取指定URL的MIMEType类型
 */
+ (NSString *)mimeType:(NSURL *)url;

@end
