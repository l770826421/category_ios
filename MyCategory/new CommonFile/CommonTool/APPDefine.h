//
//  APPDefine.h
//  ZJB_APP_2.0
//
//  Created by qiaoxing on 13-1-18.
//  Copyright (c) 2013年 My company name. All rights reserved.
//


#import "XSZ_UICommon.h"
#import "XSZ_Tooles.h"
#import "UIView+XSZCommon.h"
#import "NSString+XSZCommon.h"
#import "ChineseToPinyin.h"
#import "XSZAlertView.h"
#import "Reachability.h"
#import "BigBtn.h"


#define kDES_SessionID     @"SESSIONID"             //加密Key
//NSUserDefaults 用户默认值
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kDES_SessionID_Str  [kUserDefaults objectForKey:kDES_SessionID]     //读出SessionID
#define kFileManager          [NSFileManager defaultManager]

//监听
#define kNotifi [NSNotificationCenter defaultCenter]

//文件保存目录
#define PATH_OF_DOCUMENT        [NSHomeDirectory()  stringByAppendingPathComponent:@"Documents"]

