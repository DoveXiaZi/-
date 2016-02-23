//
//  ButtonView.m
//  demo
//
//  Created by 王振 on 16/1/20.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame withImg:(NSString *)imgName withName:(NSString *)nameString{
    
    if (self = [super initWithFrame:frame]) {
        
        _btn = [[UIButton alloc]initWithFrame:self.bounds];
        [_btn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-25, 5, 20, 20)];
        _imgView.image = [UIImage imageNamed:@"noSelect"];
        [_btn addSubview:_imgView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height/3*2, frame.size.width, frame.size.height/3)];
        _nameLabel.text = nameString;
        _nameLabel.textColor = [UIColor lightTextColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.userInteractionEnabled = YES;
        _nameLabel.font = [UIFont systemFontOfSize:12];
        [_btn addSubview:_nameLabel];
        
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    _btn.selected = !_btn.selected;
    if ([_delegate respondsToSelector:@selector(buttonViewSelect:)]) {
        [self.delegate buttonViewSelect:btn.selected];
    }
    if (_btn.selected) {
        _imgView.image = [UIImage imageNamed:@"select"];
    }else{
        _imgView.image = [UIImage imageNamed:@"noSelect"];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
