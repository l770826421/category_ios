//
//  SpringTableVC.m
//  MyCategory
//
//  Created by Developer on 15/5/22.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import "SpringTableVC.h"
#import "LKXSpringCollectionViewFlowLayout.h"
#import "UIColor+category.h"
#import "VVSpringCollectionViewFlowLayout.h"

@interface SpringTableVC () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) LKXSpringCollectionViewFlowLayout *layout;

@end

@implementation SpringTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.layout = [[LKXSpringCollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake(Dev_ScreenWidth, 44.f);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Dev_ScreenWidth, Dev_ScreenHeight) collectionViewLayout:self.layout];
    collectionView.backgroundColor = CLEARCOLOR;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view insertSubview:collectionView atIndex:0];
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

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor randomColor];
    return cell;
}

@end
