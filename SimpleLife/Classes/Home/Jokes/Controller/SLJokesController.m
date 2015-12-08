//
//  SLExchangeRateController.m
//  SimpleLife
//
//  Created by xhp on 15/10/27.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLJokesController.h"
#import "SLJokesCell.h"
#import "SLJokesFrame.h"
#import "SLJokeUser.h"
#import "SLJoke.h"

#import "MJRefresh.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface SLJokesController ()

/**
 * 存储数据模型
 */
@property (nonatomic,strong) NSMutableArray *jokesFrame;

@end

@implementation SLJokesController

#pragma mark - 懒加载
- (NSMutableArray *)jokesFrame
{
    if (_jokesFrame == nil) {
        _jokesFrame = [NSMutableArray array];
    }
    return _jokesFrame;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];

    //基本属性
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    
    //加载新数据
    [self loadJokes];
    
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewJokes)];
    
    //上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreJokes)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SDWebImageManager.sharedManager.imageCache clearMemory];
    [SDWebImageManager.sharedManager.imageCache clearDisk];
}

#pragma mark - private方法
- (void)loadJokes
{
    [SLJokeUser newJokesWithSuccess:^(NSArray *data) {

        NSMutableArray *jokeFrameArray = [NSMutableArray array];
        for (SLJoke *joke in data) {
            SLJokesFrame *jokeF = [[SLJokesFrame alloc] init];
            jokeF.joke = joke;
            [jokeFrameArray addObject:jokeF];
        }
        self.jokesFrame = jokeFrameArray;
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadNewJokes
{
    NSString *timeId = nil;
    if (self.jokesFrame.count) {
        SLJoke *s = [self.jokesFrame[0] joke];
        long long max_id = [[s unixtime] longLongValue];
        timeId = [NSString stringWithFormat:@"%lld",max_id];
    }
    
    [SLJokeUser newJokesWithTimeId:timeId sort:@"asc" success:^(NSArray *data) {
        
        [self showNewJokesCount:(int)data.count];
        //结束刷新
        [self.tableView headerEndRefreshing];
        
        NSMutableArray *jokeFrameArray = [NSMutableArray array];
        for (SLJoke *joke in data) {
            SLJokesFrame *jokeF = [[SLJokesFrame alloc] init];
            jokeF.joke = joke;
            [jokeFrameArray addObject:jokeF];
        }

        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, data.count)];
        [self.jokesFrame insertObjects:jokeFrameArray atIndexes:indexSet];
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadMoreJokes
{
    NSString *timeId = nil;
    if (self.jokesFrame.count) {
        SLJoke *s = [[self.jokesFrame lastObject] joke];
        long long max_id = [[s unixtime] longLongValue];
        timeId = [NSString stringWithFormat:@"%lld",max_id];
    }
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    [SLJokeUser newJokesWithTimeId:timeId sort:@"desc" success:^(NSArray *data) {
        
        //结束刷新
        [self.tableView footerEndRefreshing];
        
        NSMutableArray *jokeFrameArray = [NSMutableArray array];
        for (SLJoke *joke in data) {
            SLJokesFrame *jokeF = [[SLJokesFrame alloc] init];
            jokeF.joke = joke;
            [jokeFrameArray addObject:jokeF];
        }
    
        [self.jokesFrame addObjectsFromArray:jokeFrameArray];
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];

}

- (void)showNewJokesCount:(int)count
{
    CGFloat lblH = 35;
    CGFloat lblW = self.view.bounds.size.width;
    CGFloat lblX = 0;
    CGFloat lblY = CGRectGetMaxY(self.navigationController.navigationBar.frame) - lblH;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(lblX, lblY, lblW, lblH)];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    if (count == 0) {
        label.text = @"暂时没有更新哦~~~";
    }else{
        label.text = [NSString stringWithFormat:@"刷新%d条趣图~~~",count];
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    
    //文本框插入
    [self.view addSubview:label];
    
    //动画效果
    [UIView animateWithDuration:0.4 animations:^{
        
        label.transform = CGAffineTransformMakeTranslation(0, lblH);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            label.transform = CGAffineTransformIdentity;//还原
            
        } completion:^(BOOL finished) {
            
            [label removeFromSuperview];
        }];
        
    }];
}

#pragma mark - tabbleView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jokesFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    SLJokesCell *cell = [SLJokesCell cellWithTableView:tableView];
    //获取模型
    SLJokesFrame *jokesFrame = self.jokesFrame[indexPath.row];
    //将模型赋值
    cell.jokesF = jokesFrame;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLJokesFrame *jokeFrame = self.jokesFrame[indexPath.row];
    return jokeFrame.cellHeight;
    
}

@end






