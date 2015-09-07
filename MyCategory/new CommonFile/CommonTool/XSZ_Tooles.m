//
//  XSZ_Tooles.m
//  36Project
//
//  Created by xzs on 13-4-19.
//  Copyright (c) 2013年 cnmobi . All rights reserved.
//

#import "XSZ_Tooles.h"

#define MsgBox(msg) [self MsgBox:msg]

@implementation XSZ_Tooles

static MBProgressHUD *HUD;
//程序中使用的，将日期显示成  2011年4月4日 星期一
+ (NSString *) Date2StrV:(NSDate *)indate{
    
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init]autorelease];
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]]; //setLocale 方法将其转为中文的日期表达
	dateFormatter.dateFormat = @"yyyy '-' MM '-' dd ' ' EEEE";
	NSString *tempstr = [dateFormatter stringFromDate:indate];
	return tempstr;
}

//程序中使用的，将日期显示成  2011年4月4日
+ (NSString *) Date3StrV:(NSDate *)indate{
    
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init]autorelease];
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]]; //setLocale 方法将其转为中文的日期表达
	dateFormatter.dateFormat = @"yyyy '-' MM '-' dd";
	NSString *tempstr = [dateFormatter stringFromDate:indate];
	return tempstr;
}

//程序中使用的，提交日期的格式
+ (NSString *) Date2Str:(NSDate *)indate{
	
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init]autorelease];
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
	dateFormatter.dateFormat = @"yyyyMMdd";
	NSString *tempstr = [dateFormatter stringFromDate:indate];
	return tempstr;
}


+(NSString *)dateFormatString
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init]autorelease];
    dateFormat.dateFormat = @"yyyyMMdd";
    NSString *time = [dateFormat stringFromDate:date];
    
    return time;
}



+(NSString *)dateFormatString_Type02
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init]autorelease];
    dateFormat.dateFormat = @"yyyyMMddHHmmss";
    NSString *time = [dateFormat stringFromDate:date];
    
    return time;
}

+(NSString *)dateFormatString_Type03
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init]autorelease];
    dateFormat.dateFormat = @"yyyyMMddHH";
    NSString *time = [dateFormat stringFromDate:date];
    
    return time;
}


+(NSDate *)stringToDate:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}

#pragma mark - MsgBox
//提示窗口  默认按钮是：好的
+ (void)MsgBox:(NSString *)msg
{
    if(msg.length == 0) return;
    
	XSZAlertView *AlertView = [[XSZAlertView alloc] initWithTitle:nil message:msg
												   delegate:nil cancelButtonTitle:@"好的"
                                          otherButtonTitles:nil];
	[AlertView show];
    [AlertView release];
}


//提示窗口
+ (void)MsgBox:(NSString *)msg ButTitle:(NSString *)butstr
{
	
	XSZAlertView *AlertView = [[XSZAlertView alloc] initWithTitle:nil
                                                          message:msg
                                                         delegate:nil
                                                cancelButtonTitle:butstr
                                                otherButtonTitles:nil];
	[AlertView show];
    [AlertView release];
}


//提示窗口
+ (void)TS_MsgBox:(NSString *)msg ButTitle:(NSString *)butstr
{
	
	XSZAlertView *AlertView = [[XSZAlertView alloc] initWithTitle:NSLocalizedString(@"提示", @"Prompt")
                                                    message:msg
												   delegate:nil
                                          cancelButtonTitle:butstr otherButtonTitles:nil];
	[AlertView show];
    [AlertView release];
}

#pragma mark - 日期的具体信息
//获得日期的具体信息，本程序是为获得星期，注意！返回星期是 int 型，但是和中国传统星期有差异
+ (NSDateComponents *) DateInfo:(NSDate *)indate{
    
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
	NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
	comps = [calendar components:unitFlags fromDate:indate];
	
	return comps;
    
    //	week = [comps weekday];
    //	month = [comps month];
    //	day = [comps day];
    //	hour = [comps hour];
    //	min = [comps minute];
    //	sec = [comps second];
    
}

#pragma mark - 打开一个网址
//打开一个网址
+ (void) OpenUrl:(NSString *)inUrl
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:inUrl]];
}


#pragma mark - HUD 的使用
//MBProgressHUD 的使用方式，只对外两个方法，可以随时使用(但会有警告！)，其中窗口的 alpha 值 可以在源程序里修改。
+ (void)showHUD:(NSString *)msg
{	    
	HUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
	[[UIApplication sharedApplication].keyWindow addSubview:HUD];
	HUD.labelText = msg;
	[HUD show:YES];
}



//MBProgressHUD 的使用方式，只对外两个方法，可以随时使用(但会有警告！)，其中窗口的 alpha 值 可以在源程序里修改。
+ (void)showHUD:(NSString *)msg SuperView:(UIView *)SuperView
{
	HUD = [[MBProgressHUD alloc] initWithView:SuperView];
	[SuperView addSubview:HUD];
	HUD.labelText = msg;
	[HUD show:YES];
}




+ (void)removeHUD
{
	if (HUD)
    {
        [HUD hide:YES];
        [HUD removeFromSuperViewOnHide];
    }
}


//实例方法
- (void)showHUD:(NSString *)msg
{
	HUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
	[[UIApplication sharedApplication].keyWindow addSubview:HUD];
	HUD.labelText = msg;
	[HUD show:YES];
}

//实例方法
- (void)removeHUD
{
	[HUD hide:YES];
	[HUD removeFromSuperViewOnHide];
}

#pragma mark - 闪光灯开关turnTorchOn
+ (void) turnTorchOn: (BOOL)on
{
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (on) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
            }
            [device unlockForConfiguration];
        }
    }
}


#pragma mark 2.5秒后消失的Label
+(void)MsglabelTips:(NSString*) tips
{
    CGSize textSize = {200.0 ,500.0};
//    CGSize Size = [tips sizeWithFont:[UIFont boldSystemFontOfSize:12] constrainedToSize:textSize lineBreakMode:NSLineBreakByWordWrapping];
    CGSize Size = [tips boundingRectWithSize:textSize
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:12]}
                                      context:nil].size;
    CGSize CenterSize = [UIApplication sharedApplication].keyWindow.bounds.size;
    
    UILabel *label_show = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Size.width + 40, Size.height + 20)];
    
    [label_show setBackgroundColor:[UIColor grayColor]];
    [label_show setNumberOfLines:0];
    [label_show.layer setCornerRadius:5.0];
    [label_show.layer setBorderWidth:1.0];
    [label_show.layer setBorderColor:RGBCOLOR(100, 100, 100).CGColor];
    [label_show setTextAlignment:NSTextAlignmentCenter];
    [label_show setFont:[UIFont systemFontOfSize:14.0f]];
    [label_show setTextColor:[UIColor whiteColor]];
    
    
    [label_show setCenter:CGPointMake(CenterSize.width/2.0, CenterSize.height/2.0)];
    [[UIApplication sharedApplication].keyWindow addSubview:label_show];
    [label_show release];
    
    
    
    label_show.hidden=NO;
    label_show.text = tips;
    
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:2.0f];
        
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [label_show removeFromSuperview];
        });
    });
}






//裁剪图片以用于适应当前更改.....
+(UIImage *)chableImage:(NSString *)imageName LCwidth:(float)width TCheight:(float)height
{
    UIImage *sourceImage = [UIImage imageNamed:imageName];
    UIImage *chableImage = [sourceImage  stretchableImageWithLeftCapWidth:width topCapHeight:height];
    return chableImage;
}

+(UIImage *)chableImage1:(UIImage *)imageName LCwidth:(float)width TCheight:(float)height
{
    UIImage *sourceImage = imageName;
    UIImage *chableImage = [sourceImage  stretchableImageWithLeftCapWidth:width topCapHeight:height];
    return chableImage;
}


+(UIColor *) colorFromHexRGB:(NSString *) inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}



#pragma mark - GB2312ToUtf8
//GB2312ToUtf8
+(NSString *)GB2312ToUtf8:(NSData *)data
{
    NSStringEncoding  enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_2312_80);
    NSString *rststring = [[[NSString alloc]initWithData:data encoding:enc]autorelease];
    return rststring;
}



#pragma mark - XSZ_EncodeURL
+ (NSString*)XSZ_EncodeURL:(NSString *)string
{
	NSString *newString = [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding))) autorelease];
	if (newString) {
		return newString;
	}
	return @"";
}



#pragma mark - 邮箱验证、手机号码验证、车牌号验证、身份证验证
/*邮箱验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    if (mobile.length != 11)
        return NO;
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateCarNumber:(NSString *)carNumber
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carNumber];
}


/*身份证验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateCardID:(NSString *)strID
{
    NSString *cardCheck = @"^[0-9]{17}[0-9|xX]{1}$";
    NSPredicate *cardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",cardCheck];
    return [cardTest evaluateWithObject:strID];
}



#pragma mark - 判断网络是否可用
+ (BOOL) isConnectionAvailable
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    if(isJudgeNet) return YES;  //判断网络是否可用，不判断则打开，判断则屏蔽
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    NSString *SessionID = kDES_SessionID_Str;
    if (SessionID.length == 0) {
        [self MsgBox:@"您的网络不太给力哦，请稍后重试"]; return NO;
    }
    
    if (!isExistenceNetwork) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeDeterminate;
        hud.labelText = NSLocalizedString(@"网络连接异常", nil);
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        return NO;
    }
    
    return isExistenceNetwork;
}



//判断网络是否可用
+ (BOOL) isConnectionAvailableWithShowTheHUD:(BOOL)isShow
{
    if(isJudgeNet) return YES; //判断网络是否可用，不判断则打开，判断则屏蔽
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork&isShow) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeDeterminate;
        hud.labelText = NSLocalizedString(@"网络连接异常", nil);
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        return NO;
    }
    
    
    return isExistenceNetwork;
}


#pragma mark - AttributedString 设置
+(NSAttributedString *)AttributedString:(NSString *)String
{
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0.0, 0.0);//CGSizeMake(0.5, 0.5);
    NSAttributedString *AString;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        AString = [[NSAttributedString alloc]initWithString:String
                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                             RGBCOLOR(255, 255, 255), NSForegroundColorAttributeName,
                                                             shadow, NSShadowAttributeName,
                                                             [UIFont systemFontOfSize:14.0], NSFontAttributeName, nil]];
    }
    else
    {
        AString = [[NSAttributedString alloc]initWithString:String];
    }
    
    return AString;
}



#pragma mark - 经纬度距离计算
//根据两经纬度计算两点距离
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2
{
    double dd = M_PI/180;
    double x1=lat1*dd,x2=lat2*dd;
    double y1=lng1*dd,y2=lng2*dd;
    double R = 6371004;
    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    //km  返回
    return  distance/1000;
    
    //返回 m
//    return   distance;
    
}



#pragma mark - 把原来Dictionary里面的空对象转成字符长度为0的string
//把原来Dictionary里面的空对象转成字符长度为0的string
+(id)ResetDication:(NSMutableDictionary *)srcDict
{
    NSArray *KeyArray = [srcDict allKeys];
    for (NSString *KeyStr in KeyArray)
    {
        id object = [srcDict objectForKey:KeyStr];
        if ((NSNull *)object == [NSNull null])
        {
            [srcDict setObject:@"" forKey:KeyStr];
        }
    }
    return srcDict;
}


#pragma mark - 根据文字多少、格式大小绘制所需显示区域的CGSize
+(CGSize)GetStringCGSize:(NSString *)TextContent
         andRectWithSize:(CGSize)TextSize
             andFontSize:(CGFloat)FontSize
{
    
    CGSize tempSize = CGSizeZero;
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0) {
//        tempSize = [TextContent sizeWithFont:[UIFont boldSystemFontOfSize:FontSize] constrainedToSize:TextSize lineBreakMode:NSLineBreakByWordWrapping];
        tempSize = [TextContent boundingRectWithSize:TextSize
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
        CGRect Rect = [TextContent boundingRectWithSize:TextSize
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                             attributes:ContentDict
                                                context:nil];
        tempSize = Rect.size;
    }
    return tempSize;
}




@end
