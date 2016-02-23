//
//  VscrollView.h
//  轮番
//
//  Created by 王振 on 16/1/26.
//  Copyright © 2016年 王振. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VscrollViewDelegate <NSObject>

- (void)didSelectVscrollView;

@end
@interface VscrollView : UIView<UIScrollViewDelegate>
{
    UIPageControl     *_pageControl; //分页控件
    NSMutableArray *_curImageArray; //当前显示的图片数组
    NSInteger           _curPage;     //当前显示的图片位置
    NSTimer            *_timer;       //定时器
}
@property (nonatomic ,strong)NSArray *imageArray;
@property (nonatomic ,strong)UIScrollView *scrollView;
@property (nonatomic ,weak)id<VscrollViewDelegate>delegate;
@end
