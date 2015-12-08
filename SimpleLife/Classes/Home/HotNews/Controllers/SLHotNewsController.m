//
//  SLHotNewsController.m
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import "SLHotNewsController.h"
#import "SLHotNewsUser.h"
#import "SLHotNewsFrame.h"
#import "SLHotNewsCell.h"
#import "SLUrlController.h"
#import "SLHotNews.h"
#import "SLTempNavigationController.h"

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface SLHotNewsController ()

@property (nonatomic,assign) int page;

/**
 * 存储数据模型
 */
@property (nonatomic,strong) NSMutableArray *hotNews;

@end

@implementation SLHotNewsController

#pragma mark - 懒加载
- (NSMutableArray *)hotNews
{
    if (_hotNews == nil) {
        _hotNews = [NSMutableArray array];
    }
    return _hotNews;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //基本属性
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = YES;
    
    //刷新数据
    [self addRefreshView];
    
    //获取团购数据 刷新数据
    [self.tableView headerBeginRefreshing];

}

- (void)addRefreshView
{
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewHotNews)];
    
    //上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreHotNews)];
}

- (void)loadNewHotNews
{
    __typeof (self) __weak weakSelf = self;
    
    _page = 1;
    
    [SLHotNewsUser getHotNewsWithPage:_page success:^(NSArray *result) {
        
        weakSelf.hotNews = [NSMutableArray arrayWithArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView headerEndRefreshing];
        
    } failure:^(NSError *error) {
        
        [weakSelf.tableView headerEndRefreshing];
        
    }];
}

- (void)loadMoreHotNews
{
    __typeof (self) __weak weakSelf = self;
    
    _page++;
    
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    
    [SLHotNewsUser getHotNewsWithPage:_page success:^(NSArray *result) {
        
        [weakSelf.hotNews addObjectsFromArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView footerEndRefreshing];
        
    } failure:^(NSError *error) {
        
        [weakSelf.tableView footerEndRefreshing];
        
    }];
}

#pragma mark - tabbleView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hotNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    SLHotNewsCell *cell = [SLHotNewsCell cellWithTableView:tableView];
    //获取模型
    SLHotNewsFrame *hotNewsFrame = [[SLHotNewsFrame alloc] init];
    hotNewsFrame.hotNews = self.hotNews[indexPath.row];
    //将模型赋值
    cell.hotNewsF = hotNewsFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLHotNewsFrame *hotNewsFrame = [[SLHotNewsFrame alloc] init];
    hotNewsFrame.hotNews = self.hotNews[indexPath.row];
    return hotNewsFrame.cellHeight;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLUrlController *hotNewsVC = [[SLUrlController alloc] init];
    SLHotNews *hotNews = self.hotNews[indexPath.row];
    hotNewsVC.url = hotNews.link;
    
    SLTempNavigationController *navHotNewsVC = [[SLTempNavigationController alloc] initWithRootViewController:hotNewsVC];
    [self.view.window.rootViewController presentViewController:navHotNewsVC animated:YES completion:nil];
}


@end



















