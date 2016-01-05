//
//  SLDomesticNewsController.m
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import "SLFinantialNewsController.h"
#import "SLFinantialNewsUser.h"
#import "SLFinantialNewsFrame.h"
#import "SLFinantialNewsCell.h"
#import "SLUrlController.h"
#import "SLHotNews.h"
#import "SLTempNavigationController.h"

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface SLFinantialNewsController ()

@property (nonatomic,assign) int page;

/**
 * 存储数据模型
 */
@property (nonatomic,strong) NSMutableArray *finantialNews;

@end

@implementation SLFinantialNewsController

#pragma mark - 懒加载
- (NSMutableArray *)finantialNews
{
    if (_finantialNews == nil) {
        _finantialNews = [NSMutableArray array];
    }
    return _finantialNews;
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
    
    [SLFinantialNewsUser getFinantialNewsWithPage:_page success:^(NSArray *result) {
        weakSelf.finantialNews = [NSMutableArray arrayWithArray:result];
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
    
    [SLFinantialNewsUser getFinantialNewsWithPage:_page success:^(NSArray *result) {
        if (result.count) {
            [weakSelf.finantialNews addObjectsFromArray:result];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView footerEndRefreshing];
        } else {
            [weakSelf.tableView footerEndRefreshing];
            [self showMessage];
        }
    } failure:^(NSError *error) {
        
        [weakSelf.tableView footerEndRefreshing];
        
    }];
}

- (void)showMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"已经到底了哦~~" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}

#pragma mark - tabbleView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.finantialNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    SLFinantialNewsCell *cell = [SLFinantialNewsCell cellWithTableView:tableView];
    //获取模型
    SLFinantialNewsFrame *finantialNewsFrame = [[SLFinantialNewsFrame alloc] init];
    finantialNewsFrame.hotNews = self.finantialNews[indexPath.row];
    //将模型赋值
    cell.finantialNewsF = finantialNewsFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLFinantialNewsFrame *finantialNewsFrame = [[SLFinantialNewsFrame alloc] init];
    finantialNewsFrame.hotNews = self.finantialNews[indexPath.row];
    return finantialNewsFrame.cellHeight;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLUrlController *finantialNewsVC = [[SLUrlController alloc] init];
    SLHotNews *hotNews = self.finantialNews[indexPath.row];
    finantialNewsVC.url = hotNews.link;
    
    SLTempNavigationController *navFinantialNewsVC = [[SLTempNavigationController alloc] initWithRootViewController:finantialNewsVC];
    [self.view.window.rootViewController presentViewController:navFinantialNewsVC animated:YES completion:nil];
}


@end










