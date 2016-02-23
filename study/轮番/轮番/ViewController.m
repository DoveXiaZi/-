//
//  ViewController.m
//  轮番
//
//  Created by 王振 on 16/1/26.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ViewController.h"
#import "VscrollView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,VscrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *imageArr;
    VscrollView *mainScrollview;
    int currentPage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    currentPage = 0;

    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.tableFooterView = [UIView new];
    
    
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1234567890-="];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = YES;
    mainScrollview = [[VscrollView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,100)];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i<5; i++) {
        UIImageView *label = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,100)];
        label.userInteractionEnabled = YES;
        label.image = [UIImage imageNamed:[NSString stringWithFormat:@"轮播%d",i+1]];
        [arr addObject:label];
    }
    mainScrollview.imageArray = arr;
    
    [cell addSubview:mainScrollview];
    
    return cell;
    
}
- (void)didSelectVscrollView{
    NSLog(@"点击了scrollview");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
