//
//  SLTripListController.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripListController.h"
#import "SLTripUser.h"
#import "SLTripCell.h"
#import "SLUrlDetailController.h"

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface SLTripListController ()

@property (nonatomic,assign) int page;
/**
 *  存储列表数据
 */
@property (nonatomic,strong) NSMutableArray *trips;

@end

@implementation SLTripListController

#pragma mark - 懒加载
- (NSMutableArray *)trips
{
    if (_trips == nil) {
        _trips = [NSMutableArray array];
    }
    return _trips;
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
    self.title = @"热门游记";
    
    //刷新数据
    [self addRefreshView];
    
    //获取团购数据 刷新数据
    [self.tableView headerBeginRefreshing];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [SDWebImageManager.sharedManager.imageCache clearMemory];
    [SDWebImageManager.sharedManager.imageCache clearDisk];
}

- (void)addRefreshView
{
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(getNewTripData)];
    
    //上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(getMoreTGDetailData)];
}

- (void)getNewTripData
{
    __typeof (self) __weak weakSelf = self;
    
    _page = 1;
    
    [SLTripUser getTripListWithPage:_page success:^(NSArray *result) {
        
        weakSelf.trips = [NSMutableArray arrayWithArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView headerEndRefreshing];
        
    } failure:^(NSError *error) {
        [weakSelf.tableView headerEndRefreshing];
    }];
}

- (void)getMoreTGDetailData
{
    __typeof (self) __weak weakSelf = self;
    
    _page++;
    
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    [SLTripUser getTripListWithPage:_page success:^(NSArray *result) {
        
        [weakSelf.trips addObjectsFromArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView footerEndRefreshing];
        
    } failure:^(NSError *error) {
        [weakSelf.tableView footerEndRefreshing];
    }];
}

#pragma mark - private方法
- (void)backToNearby
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLTripCell *cell = [SLTripCell cellWithTableView:tableView];
    SLTripFrame *tripF = [[SLTripFrame alloc] init];
    tripF.trip = self.trips[indexPath.row];
    cell.tripF = tripF;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLTripFrame *tripF = [[SLTripFrame alloc] init];
    tripF.trip = self.trips[indexPath.row];
    return tripF.cellHeight;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLUrlDetailController *tripVC = [[SLUrlDetailController alloc] init];
    SLTrip *trip = self.trips[indexPath.row];
    tripVC.url = trip.bookUrl;
    [self.navigationController pushViewController:tripVC animated:YES];
}

@end
















