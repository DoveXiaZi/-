//
//  ButtonLabel.h
//  demo
//
//  Created by 王振 on 16/1/20.
//  Copyright © 2016年 王振. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonLabelDelegate <NSObject>

- (void)buttonLabelSelect:(BOOL)selected;

@end
@interface ButtonLabel : UIView
@property (nonatomic, strong)UIButton *btn;
@property (nonatomic, assign)id<ButtonLabelDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)string;
@end
