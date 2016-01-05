//
//  SLZipCodeController.m
//  SimpleLife
//
//  Created by xhp on 15/10/27.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLWeixinController.h"
#import "SLWeixinUser.h"
#import "SLWeixin.h"
#import "SLWeixinFrame.h"
#import "SLWeixinCell.h"
#import "SLUrlDetailController.h"
#import "SLTempNavigationController.h"

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface SLWeixinController ()

/**
 * 存储数据模型
 */
@property (nonatomic,strong) NSMutableArray *weixinFrame;
/**
 *  当前页数
 */
@property (nonatomic,assign) int pno;
/**
 *  总页数
 */
@property (nonatomic,assign) int totalpage;


@end

@implementation SLWeixinController

#pragma mark - 懒加载
- (NSMutableArray *)jokesFrame
{
    if (_weixinFrame == nil) {
        _weixinFrame = [NSMutableArray array];
    }
    return _weixinFrame;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];

    //基本属性
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToNearby)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.title = @"微信精选";
    
    //加载新数据
    [self loadWeixin];
    
    //上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreWeixin)];
}

- (void)backToNearby
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - private方法
- (void)loadWeixin
{
    [SLWeixinUser newWeixinWithPno:(int)self.pno success:^(NSArray *result) {
        
        NSMutableArray *weixinFrameArray = [NSMutableArray array];
        for (SLWeixin *weixin in result) {
            SLWeixinFrame *weixinF = [[SLWeixinFrame alloc] init];
            weixinF.weixin = weixin;
            [weixinFrameArray addObject:weixinF];
        }
        self.weixinFrame = weixinFrameArray;
        self.pno = 1;
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadMoreWeixin
{
        
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    
    self.pno++;
    
    [SLWeixinUser newWeixinWithPno:(int)self.pno success:^(NSArray *result) {
        
        //结束刷新
        [self.tableView footerEndRefreshing];
        
        NSMutableArray *weixinFrameArray = [NSMutableArray array];
        for (SLWeixin *weixin in result) {
            SLWeixinFrame *weixinF = [[SLWeixinFrame alloc] init];
            weixinF.weixin = weixin;
            [weixinFrameArray addObject:weixinF];
        }
        
        [self.weixinFrame addObjectsFromArray:weixinFrameArray];

        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];

}

#pragma mark - tabbleView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weixinFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    SLWeixinCell *cell = [SLWeixinCell cellWithTableView:tableView];
    //获取模型
    SLWeixinFrame *weixinFrame = self.weixinFrame[indexPath.row];
    //将模型赋值
    cell.weixinF = weixinFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLWeixinFrame *weixinFrame = self.weixinFrame[indexPath.row];
    return weixinFrame.cellHeight; 
}

#pragma mark - 选中某一行执行方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLUrlDetailController *weixinVC = [[SLUrlDetailController alloc] init];
    SLWeixinFrame *weixinF= self.weixinFrame[indexPath.row];
    weixinVC.url = weixinF.weixin.url;
    
    [self.navigationController pushViewController:weixinVC animated:YES];
}



@end









