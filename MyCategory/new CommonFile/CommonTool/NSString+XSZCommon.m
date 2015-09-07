//
//  NSString+XSZCommon.m
//  testApp
//
//  Created by szfh-hetw on 14-6-10.
//  Copyright (c) 2014年 huayi. All rights reserved.
//

#import "NSString+XSZCommon.h"

@implementation NSString (XSZCommon)


#pragma mark - 邮箱验证、手机号码验证、车牌号验证、身份证验证
-(BOOL)isEmail;
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


-(BOOL)isMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}



-(BOOL)isCarNumber
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}



-(BOOL)isCardID
{
    NSString *cardCheck = @"^[0-9]{17}[0-9|xX]{1}$";
    NSPredicate *cardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",cardCheck];
    return [cardTest evaluateWithObject:self];
}


#pragma mark - 返回汉字首字母  //大写
-(NSString*)ZHGetFirstLetter
{
    NSMutableString *source=[self mutableCopy];
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *firstLetter=[source substringWithRange:NSMakeRange(0, 1)];
    return [firstLetter capitalizedString];     //首字母大写
}




#pragma mark - 根据文字多少、格式大小绘制所需显示区域的CGSize
-(CGSize)GetStringCGSizeWithTextSize:(CGSize)TextSize
                         andFontSize:(CGFloat)FontSize
{
    CGSize tempSize = CGSizeZero;
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0) {
//        tempSize = [self sizeWithFont:[UIFont boldSystemFontOfSize:FontSize] constrainedToSize:TextSize lineBreakMode:NSLineBreakByWordWrapping];
        tempSize = [self boundingRectWithSize:TextSize
                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:FontSize]}
                                            context:nil].size;
    }
    else
    {
        NSDictionary *ContentDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:FontSize],
                                     NSFontAttributeName,
                                     [UIColor blackColor],
                                     NSForegroundColorAttributeName,
                                     nil];
        CGRect Rect = [self boundingRectWithSize:TextSize
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:ContentDict
                                         context:nil];
        tempSize = Rect.size;
    }
    return tempSize;
}




#pragma mark - AttributedString 设置
-(NSAttributedString *)GetAttributedStringWithStringColor:(UIColor *)StringColor
                                        andStringFontSize:(CGFloat)FontSize
                                           andShadowColor:(UIColor *)ShadowColor
                                          andShadowOffset:(CGSize)ShadowOffset
{
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = ShadowColor;   //[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    shadow.shadowOffset = ShadowOffset; //CGSizeMake(0.0, 0.0);
    NSAttributedString *AString;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        AString = [[NSAttributedString alloc]initWithString:self
                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                             StringColor, NSForegroundColorAttributeName,
                                                             shadow, NSShadowAttributeName,
                                                             [UIFont systemFontOfSize:FontSize], NSFontAttributeName, nil]];
    }
    else
    {
        AString = [[NSAttributedString alloc]initWithString:self];
    }
    
    return AString;
}





#pragma mark - MD5 16位加密 （大写  小写）
- (NSString *)MD5For16Bit_ABC:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


- (NSString *)MD5For16Bit_abc:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}






@end
