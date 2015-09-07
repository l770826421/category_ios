//
//  NSString+XSZCommon.h
//  testApp
//
//  Created by szfh-hetw on 14-6-10.
//  Copyright (c) 2014年 huayi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XSZCommon)

#pragma mark - 邮箱验证、手机号码验证、车牌号验证、身份证验证
-(BOOL)isEmail;
-(BOOL)isMobile;
-(BOOL)isCarNumber;
-(BOOL)isCardID;

#pragma mark - 返回汉字首字母  //大写
-(NSString*)ZHGetFirstLetter;


#pragma mark - 根据文字多少、格式大小绘制所需显示区域的CGSize
-(CGSize)GetStringCGSizeWithTextSize:(CGSize)TextSize
                         andFontSize:(CGFloat)FontSize;



#pragma mark - AttributedString 设置
-(NSAttributedString *)GetAttributedStringWithStringColor:(UIColor *)StringColor
                                        andStringFontSize:(CGFloat)FontSize
                                           andShadowColor:(UIColor *)ShadowColor
                                          andShadowOffset:(CGSize)ShadowOffset;



#pragma mark - MD5 16位加密 （大写  小写）
- (NSString *)MD5For16Bit_ABC:(NSString *)str;
- (NSString *)MD5For16Bit_abc:(NSString *)str;






@end
