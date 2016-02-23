//
//  ButtonView.h
//  demo
//
//  Created by 王振 on 16/1/20.
//  Copyright © 2016年 王振. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonViewDelegate <NSObject>

- (void)buttonViewSelect:(BOOL)selected;

@end
@interface ButtonView : UIView

@property (nonatomic, strong)UIButton *btn;

@property (nonatomic, strong)UIImageView *imgView;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, assign)id<ButtonViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame withImg:(NSString*)imgName withName:(NSString *)nameString;

@end
