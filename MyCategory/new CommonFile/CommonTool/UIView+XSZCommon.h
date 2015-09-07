//
//  UIView+XSZCommon.h
//  ChatApp
//
//  Created by cnmobi1 on 13-9-13.
//  Copyright (c) 2013年 cnmobi1. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kShadowViewTag 2132
#define kValidDirections [NSArray arrayWithObjects: @"top", @"bottom", @"left", @"right",nil]


/*******************************************************************************************************/
/*
 此处宏定义用于设置VIEW的动画参数
 宏定义动画效果
 */
/*******************************************************************************************************/

#define AMTION_TYPE_CATFADE         kCATransitionFade           //渐变
#define AMTION_TYPE_CATPUSH         kCATransitionPush           //推挤
#define AMTION_TYPE_CATREVEAL       kCATransitionReveal         //揭开
#define AMTION_TYPE_CATMOVEIN       kCATransitionMoveIn         //覆盖

#define AMTION_TYPE_CUBE            @"cube"                     //立方翻转
#define AMTION_TYPE_SUCKEFFECT      @"suckEffect"               //三角
#define AMTION_TYPE_OGLFLIP         @"oglFlip"                  //上下翻转
#define AMTION_TYPE_RIPPLEEFFECT    @"rippleEffect"             //水波抖动
#define AMTION_TYPE_PAGECURL        @"pageCurl"                 //上翻页
#define AMTION_TYPE_PAGEUNCURL      @"pageUnCurl"               //下翻页
#define AMTION_TYPE_CAMEROPEN       @"cameraIrisHollowOpen"     //相机打开
#define AMTION_TYPE_CAMERCLOSE	    @"cameraIrisHollowClose"    //相机关闭


//宏定义动画的方向
#define AMTION_FROM_LEFT            kCATransitionFromLeft       //从左
#define AMTION_FROM_RIGHT           kCATransitionFromRight      //从右
#define AMTION_FROM_TOP             kCATransitionFromTop        //从顶部
#define AMTION_FROM_BOTTOM          kCATransitionFromBottom     //从底部



//宏定义该应用程序所有的颜色
#define RGBCOLOR(r,g,b)             [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define ColorWithHex(str) [XSZ_Tooles colorFromHexRGB:str]
#define ImageNamed(_name)           [UIImage imageNamed:_name]
#define ImageWithRGB(r,g,b)         [UIView CreateImageWithColor:RGBCOLOR(r,g,b)]
#define ImageWithColor(Color)       [UIView CreateImageWithColor:Color]


@interface UIView (XSZCommon)

#pragma mark - 获取视图的上下左右宽高
-(float)Top;            //上
-(float)Bottom;         //下
-(float)Left;           //左
-(float)Right;          //右
-(float)Width;          //宽
-(float)Height;         //高


#pragma mark - 获取视图的常用坐标
-(CGPoint)FrameOrigin;      //FramePoint
-(CGPoint)FrameCenter;      //FrameCenter
-(CGSize)FrameSize;         //FrameSize

-(CGPoint)BoundsOrigin;     //BoundsPoint
-(CGPoint)BoundsCenter;     //BoundsCenter
-(CGSize)BoundsSize;        //BoundsSize


#pragma mark - 设置圆角,边框,边框颜色,背景颜色
//设置圆角,边框,边框颜色,背景颜色
-(void)setBackgroundColor:(UIColor *)BGColor
          andCornerRadius:(float)Radius     //5.0
           andBorderWidth:(float)Width      //2.0
           andBorderColor:(UIColor *)Color;


#pragma mark - 给视图添加一下划线
/*
 划线的起始坐标为左下角，frame的y值应该取到底部的距离
 */
-(void)addLineWithlineColor:(UIColor *)lineColor
                   andFrame:(CGRect)frame;


#pragma mark - SaveViewImage     //保存成为图片
-(UIImage *)SaveViewImage;



#pragma mark - CreateImageWithColor     //由UIColor创建图片
/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)CreateImageWithColor:(UIColor *)color;

/*
 * 创建自定义大小的UIImage
 *
 */
+ (UIImage *)CreateImageWithColor:(UIColor *)color rect:(CGRect)aRect;


#pragma mark -  //绘制可以带虚线框的View视图
- (void)setShapeLayerWithBGColor:(UIColor *)BGColor         //背景色
                  andCornerRadiu:(CGFloat)CornerRadiu       //圆角度数
                  andBorderWidth:(CGFloat)BorderWidth       //线宽
                     andPattern1:(NSInteger)Pattern1        //虚线1长度
                     andPattern2:(NSInteger)Pattern2        //虚线2长度
                  andBorderColor:(UIColor *)BorderColor;    //虚线颜色



#pragma mark - addAnimation     //添加视图动画
-(void)addAnimationWithDuration:(CFTimeInterval)Duration
                  andAmtionType:(NSString *)AmtionType
                  andAmtionFrom:(NSString *)AmtionFrom;



#pragma mark - setShadow        //设置视图阴影效果
- (void) makeInsetShadow;
- (void) makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void) makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;




#pragma mark - AllViews
+(UIImageView*)CreateImageViewWithImage:(UIImage *)image
                               andFrame:(CGRect)frame
              andUserInteractionEnabled:(BOOL)userinterface;


+(UIButton*)CreateButtonWithTitle:(NSString *)title
                         andFrame:(CGRect)frame
                          andType:(UIButtonType)type
               andBackGroundColor:(UIColor *)color
          andBackGroundIMg_Normal:(UIImage *)normalImg
         andBackGroundIMG_Highted:(UIImage *)hightedImg
                        andTarget:(id)tag
                        andAction:(SEL)action;

+(UILabel*)CreateLabelWithText:(NSString *)text
                      andFrame:(CGRect)frame
                       andFont:(UIFont *)font
                  andTextColor:(UIColor *)T_Color
            andBackgroundColor:(UIColor *)B_Color
              andTextAlignment:(NSTextAlignment)textalignment;


+(UITextField *)CreateTextFieldWithText:(NSString *)text
                               andFrame:(CGRect)frame
                                andFont:(UIFont *)font
                           andTextColor:(UIColor *)T_Color
                     andBackgroundColor:(UIColor *)B_Color
                           andPlacetext:(NSString *)placetext
                       andTextAlignment:(NSTextAlignment)textAlignment;

@end
