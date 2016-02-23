//
//  ViewController.m
//  demo
//
//  Created by 王振 on 16/1/20.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ViewController.h"
#import "ButtonView.h"
#import "ButtonLabel.h"
@interface ViewController ()<ButtonViewDelegate,ButtonLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    //带图片的button
    for (int i = 0; i<3;  i++) {
        ButtonView *view = [[ButtonView alloc]initWithFrame:CGRectMake(10+i*(90+10), 100, 90, 90)withImg:@"viewBack" withName:@"图片"];
        view.backgroundColor = [UIColor whiteColor];
        view.delegate = self;
        [self.view addSubview:view];
    }
    //不带图片的button
    ButtonLabel *label = [[ButtonLabel alloc]initWithFrame:CGRectMake(100, 300, 100, 30) withName:@"图片在右边"];
    label.delegate = self;
    [self.view addSubview:label];
    
}
#pragma mark
- (void)buttonViewSelect:(BOOL)selected{
    NSLog(@"%d",selected);
}
- (void)buttonLabelSelect:(BOOL)selected{
    NSLog(@"%d",selected);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
