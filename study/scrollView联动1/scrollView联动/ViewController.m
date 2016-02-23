//
//  ViewController.m
//  scrollView联动
//
//  Created by 王振 on 16/1/27.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ViewController.h"
#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height
@interface ViewController ()
{
    UIScrollView *topScrollView;
    UIScrollView *bottomScrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"scrollview";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 74,kScreenW-40, 64)];
    
    topScrollView.contentSize = CGSizeMake(topScrollView.frame.size.width/3*5, 64);
    topScrollView.backgroundColor = [UIColor redColor];
    topScrollView.contentOffset=CGPointMake(0, 0);
    
    [self.view addSubview:topScrollView];
    
    bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 80+74, kScreenW-40, kScreenH-80-74-49)];
    bottomScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomScrollView];
    
    [self creatUI];
}
- (void)creatUI{
    
    for (int i = 0;i < 5; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10+topScrollView.frame.size.width/3*i, 0, topScrollView.frame.size.width/3-20, 64)];
        
        btn.backgroundColor = [UIColor blueColor];
        
        [topScrollView addSubview:btn];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
