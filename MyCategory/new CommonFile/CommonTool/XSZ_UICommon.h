//
//  XSZ_UICommon.h
//  MyHeadFile
//
//  Created by qiaoxing on 13-1-12.
//  Copyright (c) 2013年 My company name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>                                   //需要添加 QuartzCore.framework 库函数
/*******************************************************************************************************/
/*
 
 此处宏定义用于当前苹果设备的硬件参数
 屏幕宽度和屏幕高度
 宏定义屏幕相关视图尺寸
 
 */
/*******************************************************************************************************/

#define Dev_Name            [UIDevice currentDevice].name                           //返回当前设备名称
#define Dev_IOSName         [UIDevice currentDevice].systemName                     //返回当前系统名称
#define Dev_IOSVersion      [[[UIDevice currentDevice] systemVersion] floatValue]   //返回当前系统版本号

#define Dev_ScreenBounds    [UIScreen mainScreen].bounds                            //返回屏幕Bounds
#define Dev_ScreenOrigin    Dev_ScreenBounds.origin                                 //返回屏幕原点
#define Dev_ScreenSize      Dev_ScreenBounds.size                                   //返回屏幕尺寸
#define Dev_ScreenOriginX   Dev_ScreenOrigin.x                                      //返回屏幕原点坐标X
#define Dev_ScreenOriginY   Dev_ScreenOrigin.y                                      //返回屏幕原点坐标Y
#define Dev_ScreenWidth     Dev_ScreenSize.width                                    //返回屏幕宽度
#define Dev_ScreenHeight    Dev_ScreenSize.height                                   //返回屏幕高度

#define Dev_AppFrame        [UIScreen mainScreen].applicationFrame                  //返回应用程序Frame
#define Dev_AppFOrigin      Dev_AppFrame.origin                                     //返回应用程序原点
#define Dev_AppFSize        Dev_AppFrame.size                                       //返回应用程序尺寸
#define Dev_AppFOriginX     Dev_AppFOrigin.x                                        //返回应用程序原点坐标X
#define Dev_AppFOriginY     Dev_AppFOrigin.y                                        //返回应用程序原点坐标Y
#define Dev_AppFWidth       Dev_AppFSize.width                                      //返回应用程序宽度
#define Dev_AppFHeight      Dev_AppFSize.height                                     //返回应用程序高度

#define isIPHone4           (Dev_ScreenHeight ==  480) ? YES : NO                   //判断是否是iphone4
#define isIPHone5           (Dev_ScreenHeight ==  568) ? YES : NO                   //判断是否是iphone5
#define isIPad              (Dev_ScreenHeight >  568) ? YES : NO                    //判断是否是ipad
#define isHideKeyBarod      ![[UIApplication sharedApplication].keyWindow isFirstResponder]
                                                                                    //判断是否隐藏键盘


#define SIZE_IPhone_Width   320                                                     //返回IPHONE屏幕宽度320
#define SIZE_IPhone_Hight   Dev_ScreenHeight                                        //返回IPHONE屏幕高度568或者480
#define SIZE_IPad_Width     768                                                     //返回IPAD屏幕宽度
#define SIZE_IPad_Hight     1004                                                    //返回IPAD屏幕高度1004

#define SIZE_TableBar_Width         SIZE_IPhone_Width                               //tabbar的宽度
#define SIZE_TableBar_Hight         49                                              //tabbar的高度
#define SIZE_NavBar_Width           SIZE_IPhone_Width                               //导航条的宽度
#define SIZE_NavBar_Hight           44                                              //导航条的宽度
#define SIZE_ToolBar_Width          SIZE_IPhone_Width                               //工具条的宽度
#define SIZE_ToolBar_Hight          44                                              //工具条的宽度
#define SIZE_StateBar_Width         SIZE_IPhone_Width                               //状态栏的宽度
#define SIZE_StateBar_Hight         20                                              //状态栏的高度

#define SIZE_IPhone_KeyboardHigth   216                                             //手机键盘高度


#define Nav_ButWidth                33
#define Nav_ButHight                30
#define Nav_BackBut_Frame           CGRectMake(5, 7, 48, 30)
#define Nav_RightBut_Frame          CGRectMake(SIZE_NavBar_Width - Nav_ButWidth - 5, 7, Nav_ButWidth, Nav_ButHight)


/*******************************************************************************************************/
/*
 常用颜色
 */
/*******************************************************************************************************/

//常用颜色
#define CLEARCOLOR [UIColor clearColor]
#define WHITECOLOR [UIColor whiteColor]
#define BLACKCOLOR [UIColor blackColor]
#define REDCOLOR   [UIColor redColor]
#define GRAYCOLOR  [UIColor grayColor]
#define GREENCOLOR [UIColor greenColor]
#define BLUECOLOR  [UIColor blueColor]
#define BROWNCOLOR [UIColor brownColor]

/*******************************************************************************************************/
/*
 读取项目的Info.plist文件
 */
/*******************************************************************************************************/
#pragma mark - Info.Plist

#define kInfoPlistDict              [[NSBundle mainBundle] infoDictionary]
#define ReadInfoPlistDict(_name)    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)_name]
#define kAppVersion                 ReadInfoPlistDict(kCFBundleVersionKey)
#define kAppBundleIdentifier        ReadInfoPlistDict(kCFBundleIdentifierKey)
//#define kAppVersion                 ReadInfoPlistDict(kCFBundleVersionKey)




/*******************************************************************************************************/
/*
 安全释放对象
 */
/*******************************************************************************************************/

#define RELEASE_SAFELY(_OPINTER)    {if(_OPINTER) {[_OPINTER release]; _OPINTER = nil; }}



/*******************************************************************************************************/
/*
 调试打印输出 XSZNLogState ＝ 1 可以打印， ＝ 0 不打印
 */
/*******************************************************************************************************/
#pragma mark - NSLog

#define XSZLogState 1

#define XSZMLog(__format, ... ) if(XSZLogState) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(__format), ##__VA_ARGS__])

#define XSZNLog(__format, ... ) if(XSZLogState) NSLog( @"%@",[NSString stringWithFormat:(__format), ##__VA_ARGS__])




/*******************************************************************************************************/
/*
 字体格式选择
 */
/*******************************************************************************************************/
#pragma mark - UIFont

#define FONT_NewRoman               @"Times New Roman"          //新罗马字体
#define FONT_NewCourier             @"Courier New"              //幼圆
#define FONT_Verdana                @"Verdana"                  //Verdana类型
#define FONT_HeitiSC                @"STHeitiSC-Medium"         //黑体简
#define FONT_HNBold                 @"HelveticaNeue-Bold"       //加粗
#define FONT_123                @"STHeitiSC"         //黑体简


#define FONT_size10                 10.0f
#define FONT_size11                 11.0f
#define FONT_size12                 12.0f
#define FONT_size14                 14.0f
#define FONT_size15                 15.0f
#define FONT_size16                 16.0f
#define FONT_size17                 17.0f
#define FONT_size18                 18.0f
#define FONT_size20                 20.0f
#define FONT_size22                 22.0f
#define FONT_size25                 25.0f

#define FontSize(_size)             [UIFont systemFontOfSize:_size]
#define FontNameSize(_name,_size)   [UIFont fontWithName:_name size:_size]



#pragma mark - XSZ_UICommon
/*******************************************************************************************************/
/*
 常用函数类型
 */
/*******************************************************************************************************/
@interface XSZ_UICommon : NSObject

+(BOOL)XSZ_IsPhoneSupported;                                    //判断当前设备是否支持IPone
+(BOOL)XSZ_IsPad;                                               //判断是设备是否IPad
+(UIInterfaceOrientation)XSZ_DeviceOrientation;                   //返回当前设备的握持姿势


//判断当前的设备是否支持该手持姿势，IPad全支持，IPhone不允许倒立持握
+(BOOL)XSZ_IsSupportedOriention:(UIInterfaceOrientation) orientation;

//判断旋转
+(CGAffineTransform) XSZ_RotateTransformForOrientTation:(UIInterfaceOrientation)orientation;


@end












