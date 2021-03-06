//
//  TestVC.m
//  MyCategory
//
//  Created by Developer on 15/4/13.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import "TestVC.h"
#import <objc/runtime.h>
#import "UIControl+Runtime.h"

@interface TestVC ()
@property (weak, nonatomic) IBOutlet UIImageView *testImgView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *effectView;
@property (weak, nonatomic) IBOutlet UIButton *runtimeBtn;

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 50, 100, 40);
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [_effectView.contentView addSubview:btn];
    
    self.view.autoresizesSubviews = NO;
    
    _runtimeBtn.lkx_acceptEventInterval = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)runtimeAction:(UIButton *)sender
{
    LKXMLog(@"runtime");
    sender.lkx_ignoreEvent = NO;
}

@end
