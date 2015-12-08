//
//  SLTuanGouController.m
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTuanGouController.h"
#import "DOPDropDownMenu.h"
#import "SLCityUser.h"
#import "SLCity.h"
#import "SLSubCategory.h"
#import "SLDealUser.h"
#import "SLDealsCell.h"
#import "SLUrlDetailController.h"

#import "MJRefresh.h"

#define topViewHeight 36
typedef enum : NSUInteger {
    sCategories,
    sDistricts,
} sDealMenu;

@interface SLTuanGouController ()<DOPDropDownMenuDataSource, DOPDropDownMenuDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
/**
 *  获取的团单
 */
@property (nonatomic, strong) NSMutableArray *deals;
/**
 *  行政区
 */
@property (nonatomic, strong) NSMutableArray *districts;
/**
 *  子类型
 */
@property (nonatomic, strong) NSArray *subCategories;
/**
 *  选中行政区
 */
@property (nonatomic, strong) SLCity *curDistrict;
/**
 *  选中子类型
 */
@property (nonatomic, strong) SLSubCategory *curSubCategory;
/**
 *  页数
 */
@property (nonatomic, assign) int page;

@end

@implementation SLTuanGouController

#pragma mark - 懒加载
- (NSArray *)subCategories
{
    if (_subCategories == nil) {
        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:self.selectedCategory.subcategories];
        SLSubCategory *allSubCategory = [[SLSubCategory alloc] init];
        allSubCategory.subcat_name = @"全部";
        [arrayM insertObject:allSubCategory atIndex:0];
        _subCategories = arrayM;
    }
    return _subCategories;
}

- (NSMutableArray *)deals
{
    if (_deals == nil) {
        _deals = [NSMutableArray array];
    }
    return _deals;
}

- (NSMutableArray *)districts
{
    if (_districts == nil) {
        _districts = [NSMutableArray array];
    }
    return _districts;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置基本属性
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToNearby)];
    self.title = [NSString stringWithFormat:@"当前城市:%@",self.selectedCity.short_name];
    
    //获得城市数据
    [self loadCityDistricts];
    
    //添加导航view
    [self addTopView];
    
    //添加tableview
    [self addTableView];
    
    //刷新数据
    [self addRefreshView];
    
    //获取团购数据 刷新数据
    [self.tableView headerBeginRefreshing];
}

#pragma mark - private方法
- (void)backToNearby
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadCityDistricts
{
    SLCity *allDistrict = [[SLCity alloc] init];
    allDistrict.district_name = @"全城";
    [self.districts addObject:allDistrict];
    
    __typeof (self) __weak weakSelf = self;
    [SLCityUser getCityWithCityId:self.selectedCity.city_id success:^(NSArray *result) {
        
        [weakSelf.districts addObjectsFromArray:result];

    } failure:^(NSError *error) {
        
    }];
}

- (void)addTopView
{
    DOPDropDownMenu *topView = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:topViewHeight];
    topView.dataSource = self;
    topView.delegate = self;
    [self.view addSubview:topView];
}

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, topViewHeight, self.view.frame.size.width, self.view.frame.size.height - topViewHeight - 64);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark 添加上下拉刷新
- (void)addRefreshView
{
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(getNewTGDetailData)];
    
    //上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(getMoreTGDetailData)];
}

- (void)getNewTGDetailData
{
    if (!self.curDistrict) {
        self.curDistrict = nil;
    }
    if (!self.curSubCategory) {
        self.curSubCategory = nil;
    }
    
    __typeof (self) __weak weakSelf = self;
    
    _page = 1;
    
    [SLDealUser getDealWithCityId:self.selectedCity.city_id districtId:self.curDistrict.district_id categoryId:self.selectedCategory.cat_id subCategoryId:self.curSubCategory.subcat_id page:_page success:^(NSArray *result) {

        weakSelf.deals = [NSMutableArray arrayWithArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView headerEndRefreshing];
        
    } failure:^(NSError *error) {
        
        [weakSelf.tableView headerEndRefreshing];
        
    }];
}

- (void)getMoreTGDetailData
{
    if (!self.curDistrict) {
        self.curDistrict = nil;
    }
    if (!self.curSubCategory) {
        self.curSubCategory = nil;
    }
    
    __typeof (self) __weak weakSelf = self;
    
    _page++;

    [SLDealUser getDealWithCityId:self.selectedCity.city_id districtId:self.curDistrict.district_id categoryId:self.selectedCategory.cat_id subCategoryId:self.curSubCategory.subcat_id page:_page success:^(NSArray *result) {
        
        [weakSelf.deals addObjectsFromArray:result];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView footerEndRefreshing];
        
    } failure:^(NSError *error) {
        
        [weakSelf.tableView footerEndRefreshing];
        
    }];
}

#pragma mark - DOPDropDownMenuDataSource
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    switch (column) {
        case sCategories:
            return self.subCategories.count;
            break;
        case sDistricts:
            return self.districts.count;
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == sCategories) {
        SLSubCategory *subCategory = self.subCategories[indexPath.row];
        return subCategory.subcat_name;
    } else if (indexPath.column == sDistricts) {
        SLCity *district = self.districts[indexPath.row];
        return district.district_name;
    } else {
        return nil;
    }
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 2;
}

#pragma mark - DOPDropDownMenuDelegate
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == sCategories) {
        SLSubCategory *subCategory = self.subCategories[indexPath.row];
        self.curSubCategory= subCategory;
    } else if (indexPath.column == sDistricts) {
        SLCity *district = self.districts[indexPath.row];
        self.curDistrict = district;
    }
    
    __typeof (self) __weak weakSelf = self;
    
    [weakSelf.tableView headerBeginRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLDealsCell *cell = [SLDealsCell cellWithTableView:tableView];
    SLDealsFrame *dealF = [[SLDealsFrame alloc] init];
    dealF.deal = self.deals[indexPath.row];
    cell.dealF = dealF;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型
    SLDealsFrame *dealF = [[SLDealsFrame alloc] init];
    dealF.deal = self.deals[indexPath.row];
    return dealF.cellHeight;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLUrlDetailController *TGDetailVC = [[SLUrlDetailController alloc] init];
    SLDeal *deal = self.deals[indexPath.row];
    TGDetailVC.url = deal.deal_murl;
    [self.navigationController pushViewController:TGDetailVC animated:YES];
}

@end


















