//
//  VscrollView.m
//  轮番
//
//  Created by 王振 on 16/1/26.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "VscrollView.h"
#define c_width self.bounds.size.width + 10//两张图片之前有10点的间隔
#define c_height self.bounds.size.height
@implementation VscrollView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,c_width,c_height)];
        self .scrollView .contentSize = CGSizeMake (0 , 3*c_height );
        self .scrollView .contentOffset = CGPointMake (0, c_height );
        self .scrollView .pagingEnabled = YES ;
        self .scrollView .showsHorizontalScrollIndicator = NO ;
        self .scrollView .delegate = self ;
        [self addSubview:self.scrollView];
        
        //分页控件
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,c_height- 30,self.bounds.size.width,30)];
        _pageControl .userInteractionEnabled = NO;
        _pageControl .hidesForSinglePage = YES;

        
        _pageControl .currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl .pageIndicatorTintColor = [UIColor grayColor];
#warning 需要分分页符的时候
//        [ self addSubview:_pageControl];
        
        //初始化数据，当前图片默认位置是0
        _curImageArray = [[NSMutableArray alloc] initWithCapacity:0];
        _curPage = 0;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //如果scrollView当前偏移位置y大于等于两倍scrollView高度
    if (scrollView.contentOffset.y>=c_height*2) {
        //当前图片位置加1
        _curPage ++;
        //如果当前图片位置超过数组边界，则设置为0
        
        if (_curPage == self.imageArray.count) {
            _curPage=0;
        }
        //刷新图片
        [self  reloadData];
        [scrollView setContentOffset:CGPointMake(0, c_height)];
    }
     //如果滚动视图当前偏移位置x小于等于0
    if (scrollView.contentOffset.y <= 0) {
        // 当前图片位置-1
        _curPage--;
        //如果当前图片位置小于数组边界，则设置为数组最后一张图片下标
        if (_curPage==-1) {
            _curPage = self.imageArray.count -1;
        }
        [self reloadData];
        
        [scrollView setContentOffset:CGPointMake(0, c_height)];
    }
    
}
- (void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    _pageControl.numberOfPages = imageArray.count;
    [self reloadData];
    
    //开启定时器
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    //判断图片长度是否大于1，如果一张图片不开启定时器
    if (imageArray.count>1) {
        _timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timerScrollImage) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        
        [[NSRunLoop currentRunLoop]runMode:UITrackingRunLoopMode beforeDate:[NSDate date]];
    }
    
}
//刷新图片
- (void)reloadData{
    _pageControl.currentPage = _curPage;
    [self getDisplayImagesWithCurpage:_curPage];
    NSArray * arr = [self.scrollView subviews];
    if (arr.count>0) {
        [arr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    for (int i = 0; i<3; i++) {
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, c_height*i, self.bounds.size.width, c_height)];
//        imageView.userInteractionEnabled = YES;
//        imageView.image = [UIImage imageNamed:_curImageArray[i]];
//        [self.scrollView addSubview:imageView];
        
        UIView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, c_height*i, self.bounds.size.width, c_height)];
        imageView.userInteractionEnabled = YES;
        [imageView addSubview:_curImageArray[i]];
//        imageView.image = [UIImage imageNamed:_curImageArray[i]];
        [self.scrollView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
        
    }
    
}
- (void)tapClick:(UITapGestureRecognizer *)tap{
    if ([_delegate respondsToSelector:@selector(didSelectVscrollView)]) {
        [self.delegate didSelectVscrollView];
    }
}
- (void)getDisplayImagesWithCurpage:(NSInteger)curPage{
    NSInteger first = curPage-1;
    NSInteger third = curPage+1;
    if (curPage==0) {
        first = self.imageArray.count-1;
    }
    if (curPage==self.imageArray.count-1) {
        third = 0;
    }
    
    if (_curImageArray.count>0) {
        [_curImageArray removeAllObjects];
    }
    
    [_curImageArray addObject:self.imageArray[first]];
    [_curImageArray addObject:self.imageArray[curPage]];
    [_curImageArray addObject:self.imageArray[third]];
    
}
- (void)timerScrollImage{
    [self reloadData];
    
    [self.scrollView setContentOffset:CGPointMake(0, c_height*2) animated:YES];
    
}
- (void)dealloc{
    self.scrollView.delegate = nil;
    [_timer invalidate];
}
@end
