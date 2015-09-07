//
//  ViewController.m
//  MyCategory
//
//  Created by Developer on 15/4/3.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import "ViewController.h"//
#import "NSString+category.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "EmailSendTool.h"

/**
 *  测试tableView和发邮件
 */
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self systemSendEmail];
    [self sendMailInApp];
//    [self doBackground];
    _tabView.editing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ================= UITableViewDataSource ====================
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"cell - %ld", (long)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"cell - 0 - %ld", (long)indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark ================== UITableViewDelegate ======================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return YES;
}

-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    if (action==@selector(copy:)) {//如果操作为复制
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];//黏贴板
        [pasteBoard setString:cell.textLabel.text];
        NSLog(@"%@",pasteBoard.string);//获得剪贴板的内容
    }
}

#pragma mark - 发邮件
//调用系统邮件发送
- (void)systemSendEmail
{
    //添加收件人
    NSMutableArray *toRecipients = [[NSMutableArray alloc] init];
    [toRecipients addObject:@"770826421@qq.com"];
    
    //添加抄送
    NSMutableArray *ccRecipients = [[NSMutableArray alloc] init];
    [ccRecipients addObject:@"kexie.liu@malama.ca"];
    
    //添加密送
    NSMutableArray *bccRecipients = [[NSMutableArray alloc] init];
    [bccRecipients addObject:@"951064078@qq.com"];
    
    [EmailSendTool systemSendEmailWithRecipients:toRecipients
                                 andCcRecipients:ccRecipients
                                andBccRecipients:bccRecipients
                                        addTheme:@"test 2"
                                         addBody:@"EmailSendTool test send email"];
}

#pragma mark - 在应用内发送邮件
//激活邮件功能
- (void)sendMailInApp
{
    Class mailClass = NSClassFromString(@"MFMailComposeViewController");
    if (!mailClass)
    {
        XSZMLog(@"用户没有设置邮件账户");
        return;
    }
    [self displayMailPicker];
}

- (void)displayMailPicker
{
//    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
//    mailPicker.mailComposeDelegate = self;
    
    //设置主题
//    [mailPicker setSubject:@"email主题"];
    //添加收件人
    NSArray *toRecipients = [NSArray arrayWithObject:@"770826421@qq.com"];
//    [mailPicker setToRecipients:toRecipients];
    //添加抄送
    NSArray *ccRecipients = [NSArray arrayWithObject:@"951064078@qq.com"];
//    [mailPicker setCcRecipients:ccRecipients];
    
    //添加密送
    NSArray *bccRecipients = [NSArray arrayWithObject:@"kexie.liu@malama.ca"];
//    [mailPicker setBccRecipients:bccRecipients];
    
//    //添加一张图片
//    UIImage *addPic = [UIImage imageNamed:@"rewards_on.png"];
//    NSData *imageData = UIImagePNGRepresentation(addPic);
//    [mailPicker addAttachmentData:imageData mimeType:@"image/png" fileName:@"rewards_on.png"];
//    
//    //添加pdf附件
//    NSString *file = [[NSBundle mainBundle] pathForResource:@"商品发布及检索功能使用说明" ofType:@"pdf"];
//    NSData *pdf = [NSData dataWithContentsOfFile:file];
//    [mailPicker addAttachmentData:pdf mimeType:@"application/pdf" fileName:@"商品发布及检索功能使用说明.pdf"];
    
//    NSString *emailBody = @"<font color='red'>eMail</font>正文";
//    [mailPicker setMessageBody:emailBody isHTML:YES];
//    [self presentViewController:mailPicker animated:YES completion:^{
//    
//    }];
    
    NSMutableArray *arr = [NSMutableArray array];
    NSString *file0 = [[NSBundle mainBundle] pathForResource:@"商品发布及检索功能使用说明" ofType:@"pdf"];
    [arr addObject:file0];
    NSString *file1 = [[NSBundle mainBundle] pathForResource:@"rewards_on" ofType:@"png"];
    [arr addObject:file1];
    
    [EmailSendTool mailComposeSendEmailWithRecipients:toRecipients
                                      andCcRecipients:ccRecipients
                                     andBccRecipients:bccRecipients
                                             addTheme:@"mailCompose4"
                                              addBody:@"MFMailComposeViewController send email 4"
                                    addAttachmentFile:arr
                                          addDelegate:self];
}

#pragma mark - 实现 MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //关闭邮件发送窗口
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSString *msg;
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"用户取消编辑邮件";
            break;
        case MFMailComposeResultSaved:
            msg = @"用户成功保存邮件";
            break;
        case MFMailComposeResultSent:
            msg = @"用户点击发送,将邮件放到队列中,还没发送";
            break;
        case MFMailComposeResultFailed:
            msg = @"用户视图保存或者发送邮件失败";
            break;
        default:
            msg = @"其他";
            break;
    }
    XSZMLog(@"msg == %@", msg);
}


#pragma mark - 后台测试
- (void)doBackground
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self beginBackgroundUpdateTask];
        
        [self endBackgroundUpdateTask];
    });
}

- (void)beginBackgroundUpdateTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void)endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
}

@end
