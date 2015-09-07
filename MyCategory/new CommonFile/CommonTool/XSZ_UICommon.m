//
//  XSZ_UICommon.m
//  MyHeadFile
//
//  Created by qiaoxing on 13-1-12.
//  Copyright (c) 2013年 My company name. All rights reserved.
//

#import "XSZ_UICommon.h"

@implementation XSZ_UICommon


//判断当前设备是否支持IPone
+(BOOL)XSZ_IsPhoneSupported
{
    NSString *deviceType = [UIDevice currentDevice].model;
    return [deviceType isEqualToString:@"iPhone"];
}

//判断是设备是否IPad
+(BOOL)XSZ_IsPad
{
#ifdef __IPHONE_3_2
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#else
    return NO;
#endif    
}

//返回当前设备的握持姿势
+(UIDeviceOrientation)XSZ_DeviceOrientation
{
    UIDeviceOrientation orient = [UIDevice currentDevice].orientation;
    if (orient == UIDeviceOrientationUnknown)
    {
        return UIDeviceOrientationPortrait;
    }
    else
        return orient;
}

//判断当前的设备是否支持该手持姿势，IPad全支持，IPhone不允许倒立持握
+(BOOL)XSZ_IsSupportedOriention:(UIInterfaceOrientation) orientation
{
    if ([self XSZ_IsPad])
        return YES;
    else
    {
        switch (orientation)
        {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                return YES;
            default:
                return NO;
        }
    }
}


//判断旋转
+(CGAffineTransform) XSZ_RotateTransformForOrientTation:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft)
    {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        return CGAffineTransformMakeRotation(M_PI/2);
    }
    else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return CGAffineTransformMakeRotation(-M_PI);
    }
    else
        return CGAffineTransformIdentity;
}



@end









