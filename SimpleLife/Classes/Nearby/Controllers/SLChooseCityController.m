//
//  SLChooseCityController.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLChooseCityController.h"
#import "SLBaseData.h"
#import "SLSearchCityController.h"
#import "SLCoverView.h"


#define searchBerHeight 36

@interface SLChooseCityController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *citySections;
@property (nonatomic,strong) NSMutableDictionary *totalCities;

@property (nonatomic,strong) SLCoverView *coverView;
@property (nonatomic,strong) SLSearchCityController *searchResult;

@end

@implementation SLChooseCityController

#pragma mark - 懒加载
- (NSMutableArray *)citySections{
    if (_citySections == nil) {
        _citySections = [NSMutableArray array];
        [_citySections addObjectsFromArray:[SLBaseData sharedSLBaseData].totalCitySections];
    }
    return _citySections;
}

- (NSMutableDictionary *)totalCities
{
    if (_totalCities == nil) {
        _totalCities = [NSMutableDictionary dictionary];
        _totalCities = [SLBaseData sharedSLBaseData].totalCities;
    }
    return _totalCities;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //保证位于navigationBar下面
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToNearby)];
    
    // 添加搜索框
    [self addSearchBar];
    
    // 添加tableView
    [self addTableView];
}

- (void)addSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.frame = CGRectMake(0, 0, self.view.frame.size.width, searchBerHeight);
    searchBar.delegate = self;
    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    searchBar.placeholder = @"请输入城市名或拼音";
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
}

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    CGFloat tableViewH = self.view.frame.size.height - searchBerHeight;
    tableView.frame = CGRectMake(0, searchBerHeight, self.view.frame.size.width, tableViewH);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)backToNearby
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 监听搜索框的文字改变
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0) {
        //隐藏搜索界面
        [_searchResult.view removeFromSuperview];
    } else {
        // 显示搜索界面
        if (_searchResult == nil) {
            _searchResult = [[SLSearchCityController alloc] init];
            _searchResult.view.frame = self.coverView.frame;
            _searchResult.view.autoresizingMask = self.coverView.autoresizingMask;
            [self addChildViewController:_searchResult];
        }
        _searchResult.searchText = searchText;
        [self.view addSubview:_searchResult.view];
    }
}

//点击取消
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self coverClicked];
}

//searchBar结束焦点
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self coverClicked];
}

#pragma 搜索框聚焦
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    [searchBar setShowsCancelButton:YES animated:YES];
    
    if (self.coverView == nil) {
        self.coverView = [SLCoverView coverWithTarget:self action:@selector(coverClicked)];
    }
    
    self.coverView.frame = self.tableView.frame;
    self.coverView.alpha = 0.0;
    [self.view addSubview:self.coverView];
    [UIView animateWithDuration:0.3 animations:^{
        [self.coverView reset];
    }];
}

//cover遮罩点击
- (void)coverClicked
{
    //移除遮罩
    [UIView animateWithDuration:0.3 animations:^{
        self.coverView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
    }];
    
    //取消按钮消失
    [self.searchBar setShowsCancelButton:NO animated:YES];
    
    //键盘消失
    [self.searchBar resignFirstResponder];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.citySections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.totalCities objectForKey:[self.citySections objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"chooseCity";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSMutableArray *array = [self.totalCities objectForKey:[self.citySections objectAtIndex:indexPath.section]];
    SLPerCity *city = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = city.short_name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.citySections[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.citySections;
}

#pragma mark - tableview代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *array = [self.totalCities objectForKey:[self.citySections objectAtIndex:indexPath.section]];
    SLPerCity *city = array[indexPath.row];
    [SLBaseData sharedSLBaseData].currentCity = city;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end










