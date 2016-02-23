//
//  SecondViewController.h
//  ReactCocoa学习
//
//  Created by 王振 on 16/2/17.
//  Copyright © 2016年 王振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SecondViewController : UIViewController
@property(nonatomic, strong)RACSubject *delegateSingal;
@end
