//
//  XSZ_Tooles.h
//  36Project
//
//  Created by 李恩 on 13-4-19.
//  Copyright (c) 2013年 cnmobi . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <AVFoundation/AVFoundation.h>
#import "MBProgressHUD.h"


#define PromptMsg           NSLocalizedString(@"Access error",@"访问错误")
#define theNetNotAvailable  @"网络不给力"
#define theNetError         @"网络故障"

//建立密码转换宏
#define __BASE64( text )        [CommonFunc base64StringFromText:text]
#define __TEXT( base64 )        [CommonFunc textFromBase64String:base64]

#define PAString(Str)               [XSZ_Tooles AttributedString:Str]
#define ImageChable(_pointer,a,b)   [XSZ_Tooles chableImage:_pointer LCwidth:a TCheight:b]


//判断网络是否可用，1判断直接默认网络可用，0不判断网络环境
#define isJudgeNet   0



@interface XSZ_Tooles : NSObject
{   
    BOOL isShowHUD;
}

+(UIImage *)chableImage1:(UIImage *)imageName LCwidth:(float)width TCheight:(float)height;


//程序中使用的，将日期显示成  2011年4月4日 星期一
+ (NSString *)Date2StrV:(NSDate *)indate;

//程序中使用的，将日期显示成  2011年4月4日 
+ (NSString *) Date3StrV:(NSDate *)indate;

//程序中使用的，提交日期的格式
+ (NSString *)Date2Str:(NSDate *)indate;

//程序中使用的，提交日期的格式 yyyy-MM-dd HH:mm
+(NSString *)dateFormatString;

//程序中使用的，提交日期的格式 yyyyMMddHHmmss
+(NSString *)dateFormatString_Type02;

//程序中使用的，提交日期的格式 yyyyMMddHH
+(NSString *)dateFormatString_Type03;

+(NSDate *)stringToDate:(NSString *)dateStr;

//提示窗口  默认按钮是：好的
+ (void)MsgBox:(NSString *)msg;

//消息弹窗，两种格式....
+ (void)MsgBox:(NSString *)msg ButTitle:(NSString *)butstr;
+ (void)TS_MsgBox:(NSString *)msg ButTitle:(NSString *)butstr;

//获得日期的具体信息，本程序是为获得星期，注意！返回星期是 int 型，但是和中国传统星期有差异
+ (NSDateComponents *)DateInfo:(NSDate *)indate;

//打开一个网址
+ (void)OpenUrl:(NSString *)inUrl;


#pragma mark - MBProgressHUD
//MBProgressHUD 的使用方式，只对外两个方法，可以随时使用(但会有警告！)，其中窗口的 alpha 值 可以在源程序里修改。
+ (void)showHUD:(NSString *)msg;
+ (void)showHUD:(NSString *)msg SuperView:(UIView *)SuperView;
+ (void)removeHUD;

- (void)showHUD:(NSString *)msg;
- (void)removeHUD;


#pragma mark - 图片拉伸
//裁剪图片以用于适应当前更改.....
+(UIImage *)chableImage:(NSString *)imageName LCwidth:(float)width TCheight:(float)height;


#pragma mark - inColorString格式:f3f3f3
+(UIColor *) colorFromHexRGB:(NSString *) inColorString;


#pragma mark - 闪光灯开关turnTorchOn
+ (void) turnTorchOn: (BOOL) on;


#pragma mark 2.5秒后消失的Label
+(void)MsglabelTips:(NSString*) tips;



//GB2312转Utf8字符
+(NSString *)GB2312ToUtf8:(NSData *)data;
#pragma mark - XSZ_EncodeURL
+ (NSString*)XSZ_EncodeURL:(NSString *)string;

#pragma mark -  判断email、mobile 等
/*邮箱验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateEmail:(NSString *)email;

/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile;

/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateCarNumber:(NSString *)carNumber;

/*身份证验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateCardID:(NSString *)strID;

#pragma mark - 判断网络是否可用
+ (BOOL) isConnectionAvailable;
//判断网络是否可用
+ (BOOL) isConnectionAvailableWithShowTheHUD:(BOOL)isShow;





#pragma mark - AttributedString
+(NSAttributedString *)AttributedString:(NSString *)String;



#pragma mark - 根据经纬度测算距离
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2;



//把原来Dictionary里面的空对象转成字符长度为0的string
+(id)ResetDication:(NSMutableDictionary *)srcDict;



#pragma mark - 根据文字多少、格式大小绘制所需显示区域的CGSize
+(CGSize)GetStringCGSize:(NSString *)TextContent
         andRectWithSize:(CGSize)TextSize
             andFontSize:(CGFloat)FontSize;

@end