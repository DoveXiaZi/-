//
//  ViewController.m
//  ReactCocoa学习
//
//  Created by 王振 on 16/2/17.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    RACSignal *singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        [subscriber sendNext:@"12333"];
//        
//        return [RACSerialDisposable disposableWithBlock:^{
//        
//            NSLog(@"信号被销毁");
//        
//        }];
//    }];
//    
//    [singal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//
//    
//    RACSubject *subject = [RACSubject subject];
//    
//    [subject subscribeNext:^(id x) {
//        NSLog(@"信号1%@",x);
//    }];
//    
//    [subject sendNext:@"发送信号"];
    
    
}
- (IBAction)btnClick:(id)sender {
    
    SecondViewController *secVC = [[SecondViewController alloc]init];
    
    secVC.delegateSingal = [RACSubject subject];
    
    [secVC.delegateSingal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [self.navigationController pushViewController:secVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
