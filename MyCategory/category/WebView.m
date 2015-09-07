//
//  WebView.m
//  HaiWangXC
//
//  Created by lkx on 14-11-28.
//  Copyright (c) 2014年 cnmobi. All rights reserved.
//

#import "WebView.h"

@implementation WebView 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delegate = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - 
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestString = [[request.URL absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([requestString hasPrefix:@""])
    {
        //返回产品
        NSString *goodId = [[requestString componentsSeparatedByString:@"="] lastObject];
        if (self.ReturnWebInfoBlock)
        {
            self.ReturnWebInfoBlock(goodId);
        }
        return NO;
    }
//    else if ([requestString hasPrefix:@"http://"])
//    {
//        //返回URL
//        if (self.ReturnWebInfoBlock)
//        {
//            self.ReturnWebInfoBlock(requestString);
//        }
////        return YES;
//    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    XSZNLog(@"开始下载");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    XSZNLog(@"结束下载");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    XSZNLog(@"错误error == %@", error.description);
}

@end
