//
//  NewTuijianTableViewCell.m
//  Cycling
//
//  Created by apple on 15/12/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ScrollviewNotice.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "UiDateUtil.h"


#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height
@implementation ScrollviewNotice
{
    UIImageView *imageView;
    
    SHLUILabel *titleLabel;
    
    SHLUILabel *chejiaLabel;
//    
//    UILabel *lunzuLabel;
//
//    UILabel *qianchaLabel;
    
    UILabel *seeLabel;
    
    UILabel *moneyLabel;
    
    UILabel *messageLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kScreenW / 3 ,70)];
//        imageView.clipsToBounds = YES;
//        imageView.layer.cornerRadius = 70 / 2;
        
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColorUtil colorWithHexString:@"#DCDCDC" alpha:1.0];
        [self addSubview:imageView];
        
        
        
        titleLabel = [[SHLUILabel alloc]initWithFrame:CGRectMake(kScreenW / 3 + 20, 5, kScreenW -(kScreenW / 3 + 20) - 10, 30)];
       
        [self addSubview:titleLabel];
        
        chejiaLabel = [[SHLUILabel alloc]initWithFrame:CGRectMake(kScreenW / 3 + 20, 30,kScreenW - (kScreenW / 3 + 20) - 10 , 30)];
        

        [self addSubview:chejiaLabel];
        
       
        
        
        moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW / 3 + 20, 70, 150 , 10)];
        moneyLabel.textColor = [UIColor grayColor];
        moneyLabel.font = [UIFont systemFontOfSize:10];
        moneyLabel.text = @"2015.12.07";
        [self addSubview:moneyLabel];
        
        
        
        
//        UIButton *pinglunBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW - 70, 120 - 20, 30, 20)];
////        pinglunBtn.backgroundColor = [UIColor yellowColor];
//        
//        [pinglunBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        
//        [pinglunBtn setTitle:@"评论" forState:UIControlStateNormal];
//        pinglunBtn.titleLabel.font = [UIFont systemFontOfSize:10];
//        
//        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW - 100 , 70, 15, 15)];
        imageView1.image = [UIImage imageNamed:@"button_seepwd_normal"];
        
        [self addSubview:imageView1];
        
        
        
    
//
//
        seeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW - 100 + 20, 70, 40, 15)];
//        seeLabel.text =
        seeLabel.textColor = [UIColor grayColor];
        seeLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:seeLabel];
        
//        UIButton *dianzanBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW - 30 , 120 - 20, 20, 20)];
//        
//        [dianzanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        
//        [dianzanBtn setTitle:@"赞" forState:UIControlStateNormal];
//        dianzanBtn.titleLabel.font = [UIFont systemFontOfSize:10];
//        
//
//    
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW - 60, 70, 15, 15)];
        imageView2.image = [UIImage imageNamed:@"message_nor"];
//
        [self addSubview:imageView2];
//
        
        
        
        
        
        messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW - 60 + 20, 70, 40, 15)];
        messageLabel.textColor = [UIColor grayColor];
//        messageLabel.text = @"0";
        messageLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:messageLabel];
        
//        
//        [self addSubview:dianzanBtn];
    }
    
    
    return self;

}


-(void)setModel:(TuijianModel *)model{
    _model = model;
    [chejiaLabel removeFromSuperview];
    
    chejiaLabel = [[SHLUILabel alloc]initWithFrame:CGRectMake(kScreenW / 3 + 20, 30,kScreenW - (kScreenW / 3 + 20) - 10 , 30)];
    chejiaLabel.textColor = [UIColor grayColor];
    chejiaLabel.numberOfLines = 0;
    chejiaLabel.font = [UIFont systemFontOfSize:12];
    chejiaLabel.characterSpacing = 1;

    [self addSubview:chejiaLabel];
    
    
    [titleLabel removeFromSuperview];
    
    titleLabel = [[SHLUILabel alloc]initWithFrame:CGRectMake(kScreenW / 3 + 20, 5, kScreenW -(kScreenW / 3 + 20) - 10, 30)];
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.numberOfLines = 0;
    titleLabel.characterSpacing = 1;
    
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];

    
    
    if (self.model.icon != (NSString*)[NSNull null]) {
        NSString *imageURL = [kBaseURL stringByAppendingString:_model.icon];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"morenNotice"]];
    }else{
        imageView.image = [UIImage imageNamed:@"morenNotice"];
    }
   
    
    
    if (self.model.description1 != (NSString*)[NSNull null]) {
    
        chejiaLabel.text = [NSString stringWithFormat:@"%@",_model.description1];
        
    }
    
    if (self.model.title != (NSString*)[NSNull null]) {
        
        
       
         titleLabel.text = _model.title;
    }

    if (self.model.publishtime != (NSString*)[NSNull null]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date = [dateFormatter dateFromString:_model.publishtime];

        NSString *jg = [UiDateUtil compareCurrentTime:date];
        moneyLabel.text = jg;

    }
    
    if (self.model.browsecount != (NSString*)[NSNull null]) {
        NSString *jg = _model.browsecount;
        seeLabel.text = [NSString stringWithFormat:@"%@",jg];
        
    }
    if (self.model.commentscount != (NSString*)[NSNull null]) {
        NSString *jg = _model.commentscount;
        messageLabel.text = [NSString stringWithFormat:@"%@",jg];
        
    }



    

    
    
    
//    titleLabel.text = _model.bt;
//    
//
//    qianchaLabel.text = [NSString stringWithFormat:@"轮组：%@",_model.qchMc];
//    NSString *jg = _model.jg;
//    
    
//    moneyLabel.text = [NSString stringWithFormat:@"￥%@",jg];


}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
