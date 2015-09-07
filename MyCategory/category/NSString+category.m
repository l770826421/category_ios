//
//  NSString+category.m
//  HaiWangXC
//
//  Created by lkx on 14-11-24.
//  Copyright (c) 2014年 cnmobi. All rights reserved.
//

#import "NSString+category.h"

@implementation NSString (category)
/*
 * 获取手机的UUID
 */
+ (NSString *)uuid
{
//    CFUUIDRef puuid = CFUUIDCreate(nil);
//    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
//    NSString *uuid = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuidStr = [NSString stringWithFormat:@"%@", uuid];
    NSArray *uuidArr = [uuidStr componentsSeparatedByString:@" "];
    return [uuidArr lastObject];
}

/*
 * 将字符串中得某些字符或字符串设置不同字体颜色
 * 此方法是将第一个字符设置为黑色，其他字符为红色
 * @parameter str 需要设置的字符串
 *
 * @return 返回类型为NSAttributedString
 */
+ (NSAttributedString *)attributedText:(NSString *)str
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSRange range0 = NSMakeRange(0, 1);
    [attributedString addAttribute:NSForegroundColorAttributeName value:BLACKCOLOR range:range0];
    NSRange range1 = NSMakeRange(1, str.length - 1);
    [attributedString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
    return attributedString;
}

/*
 * 获取attributedString的属性字典
 * @parameter str 需要获取attributedString的字符串
 *
 * @return 返回类型为NSDictionary
 */
+ (NSDictionary *)attributedDic:(NSString *)str
{
    NSAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, attributedStr.length);
    NSDictionary *dic = [attributedStr attributesAtIndex:0 effectiveRange:&range];
    return dic;
}

/*
 * 将两个字符串拼接在一起,但是两个字符串的字体颜色不一样
 * @parameter text1 字符串1
 * @parameter color1 字符串1的字体颜色
 * @parameter text2 字符串2
 * @parameter color2 字符串2的字体颜色
 * @parameter splitStr 连个字符串之间的连接符,长度为3,分别是拼接后的前缀、两个字符串连接符、后缀
 */
+ (NSAttributedString *)attributedText1:(NSString *)text1 color1:(UIColor *)color1 text2:(NSString *)text2 color2:(UIColor *)color2 split:(NSArray *)splitArray
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@%@", splitArray[0], text1, splitArray[1], text2, splitArray[2]]];
    NSString *splitStr0 = splitArray[0];
    
    NSRange range = NSMakeRange(0, splitStr0.length);
    [attributedStr addAttribute:NSForegroundColorAttributeName value:BLACKCOLOR range:range];
    
    int length = (int)splitStr0.length;
    range = NSMakeRange(length, text1.length);
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color1 range:range];
    
    NSString *splitStr1 = splitArray[1];
    range = NSMakeRange(length + text1.length, splitStr1.length);
    [attributedStr addAttribute:NSForegroundColorAttributeName value:BLACKCOLOR range:range];
    
    range = NSMakeRange(length + text1.length + splitStr1.length, text2.length);
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color2 range:range];
    
    NSString *splitStr2 = splitArray[2];
    range = NSMakeRange(length + text1.length + splitStr1.length + text2.length, splitStr2.length);
    [attributedStr addAttribute:NSForegroundColorAttributeName value:BLACKCOLOR range:range];
    
    return attributedStr;
}

/*
 * 判断字符串是不是数字字符串
 * @parameter str 要判断的字符串
 */
+ (BOOL)isNumString:(NSString *)str
{
    NSString *regex = @"(/^[0-9]*$/)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [predicate evaluateWithObject:str];
    return isMatch;
}

/*
 * 去除字符串最后的字符串
 * @parameter string 要去除的字符串
 * @parameter suffixStr 去除的字符串
 */
+ (NSString *)subSuffixStr:(NSMutableString *)string suffixString:(NSString *)suffixStr
{
    NSString *src;
    if ([string hasSuffix:suffixStr])
    {
        src = [string substringToIndex:(string.length - suffixStr.length)];
    }
    return src;
}

/*
 * 将手机号中间四位置为*
 * 例如: 15845689541 -> 158****9541
 * @parameter phoneString 手机号码
 */
+ (NSString *)phoneChangeWithStar:(NSString *)phoneString
{
    NSMutableString *src = [NSMutableString stringWithString:phoneString];
    [src replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    NSString *str = [src stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return str;
}

/*
 * 绝对值
 */
+ (int)absoluteValue:(int)number
{
    if (number < 0)
    {
        return -number;
    }
    else
    {
        return number;
    }
}


/*
 * 获取指定URL的MIMEType类型
 */
+ (NSString *)mimeType:(NSURL *)url
{
    //1NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //2NSURLConnection
    
    //3 在NSURLResponse里，服务器告诉浏览器用什么方式打开文件。
    
    //使用同步方法后去MIMEType
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSLog(@"---%@", response.MIMEType);
    return response.MIMEType;
}

@end
