//
//  MBHUDTool.h
//  malama_ca
//
//  Created by Developer on 15/4/8.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SingletonMacro.h"
#import "MBProgressHUD.h"

@interface MBHUDTool : NSObject <MBProgressHUDDelegate>
single_interface(MBHUDTool)

//显示MBProgressHUD正在加载,并提示文字
- (void)showHUDWithText:(NSString *)text;

//显示1秒钟的MBProgressHUD文字提示
- (void)showHUDAfterDelayWithText:(NSString *)text;

//显示一个数据加载的动画,小菊花
- (void)showActivityIndicator;

//加载自定义view
- (void)showCustomView;

#pragma mark - 以下三个适合做上传下载
//显示一个圆环加载
- (void)showAnnular;

//一个横向的进度条
- (void)showHorizontalBar;

//显示一个圆圈加载
- (void)showDeterminate;

//隐藏一处MBProgressHUD
- (void)hideMBHUD:(BOOL)animated;

//判断MBHUD是否存在
- (BOOL)isShow;

#pragma mark - 非MBProgressHUD
/**
 *  显示一些信息在2.5秒后消失
 *
 *  @param tips 显示的字符串
 */
+ (void)messageLabelTips:(NSString *)tips;

@end
