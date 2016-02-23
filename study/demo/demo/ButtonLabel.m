//
//  ButtonLabel.m
//  demo
//
//  Created by 王振 on 16/1/20.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ButtonLabel.h"

@implementation ButtonLabel

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)string{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 3.0;
        self.layer.borderWidth = 0.3;
        self.clipsToBounds = YES;
        _btn = [[UIButton alloc]initWithFrame:self.bounds];
        [_btn setTitle:string forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_btn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_btn];
    }
    return self;
}

- (void)btnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if ([_delegate respondsToSelector:@selector(buttonLabelSelect:)]) {
        [self.delegate buttonLabelSelect:btn.selected];
    }}

@end
