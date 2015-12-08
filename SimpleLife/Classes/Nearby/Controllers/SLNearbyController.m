//
//  SLNearbyController.m
//  SimpleLife
//
//  Created by xhp on 15/11/4.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNearbyController.h"
#import "SLNearbyCatagory.h"
#import "SLNearbyStaticCell.h"
#import "SLChooseCityController.h"
#import "SLCity.h"
#import "SLBaseData.h"
#import "SLTuanGouController.h"

@interface SLNearbyController ()

/**
 *  储存团购类型
 */
@property (nonatomic,strong) NSArray *catagory;

@end

@implementation SLNearbyController

#pragma mark - 懒加载
- (NSArray *)catagory
{
    if (_catagory == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Categories.plist" ofType:nil];
        NSArray *originArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayOut = [NSMutableArray array];
        for (NSArray *outArray in originArray) {
            NSMutableArray *arrayIn = [NSMutableArray array];
            for (NSDictionary *dicOut in outArray) {
                SLNearbyCatagory *catagoryN = [SLNearbyCatagory catagoryWithDictionary:dicOut];
                [arrayIn addObject:catagoryN];
            }
            [arrayOut addObject:arrayIn];
        }
        _catagory = arrayOut;
    }
    return _catagory;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    {
//    //拿城市列表
//    [SLCityUser getCitiesWithSuccess:^(NSArray *result) {
//{//        for (SLCities *city in result) {
////            NSLog(@"%@",city.short_name);
////        }
////        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
////        NSString *plistPath1 = [paths objectAtIndex:0];
////        
////        //得到完整的文件名
////        NSString *filename=[plistPath1 stringByAppendingPathComponent:@"test.plist"];
////       NSLog(@"%@",filename);
////        [result writeToFile:filename atomically:YES];
////        NSMutableArray *array = [NSMutableArray array];
////        for (NSDictionary *dic in result) {
////            NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithDictionary:dic];
////            [dict removeObjectsForKeys:@[@"city_name",@"city_pinyin",@"short_pinyin"]];
////            [array addObject:dict];
////        }
////        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
////        NSString *plistPath1 = [paths objectAtIndex:0];
////
////        //得到完整的文件名
////        NSString *filename=[plistPath1 stringByAppendingPathComponent:@"Category.plist"];
////       NSLog(@"%@",filename);
////        [result writeToFile:filename atomically:YES];
//}
//    } failure:^(NSError *error) {
//        
//    }];
//
    }
    //设置基本属性
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
    self.tableView.sectionHeaderHeight = 20;
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];

    //设置navigationBar
    [self settingNavigationBar];
    
    // 监听选择城市改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange) name:@"city_change" object:nil];
}

- (void)settingNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName,nil]];

    UIBarButtonItem *cityItem = [[UIBarButtonItem alloc] initWithTitle:[SLBaseData sharedSLBaseData].currentCity.short_name style:UIBarButtonItemStylePlain target:self action:@selector(setCityLocation)];
    [cityItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = cityItem;
 
}

#pragma mark - 城市改变
- (void)cityChange
{
    self.navigationItem.leftBarButtonItem.title = [SLBaseData sharedSLBaseData].currentCity.short_name;
}

#pragma mark - privata方法
- (void)setCityLocation
{
    SLChooseCityController *chooseCity = [[SLChooseCityController alloc] init];
    chooseCity.title = [NSString stringWithFormat:@"当前城市:%@",self.navigationItem.leftBarButtonItem.title];
    chooseCity.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chooseCity animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.catagory count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.catagory[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    SLNearbyStaticCell *cell = [SLNearbyStaticCell cellWithTableView:tableView];
    NSArray *temp = self.catagory[indexPath.section];
    SLNearbyCatagory *catagoryModel = temp[indexPath.row];
    if (indexPath.row < temp.count - 1) {//控制分割线的显示
        cell.seperator = YES;
    }
    cell.catagoryModel = catagoryModel;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    return view;
}

#pragma mark - tableView点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLTuanGouController *tuanG = [[SLTuanGouController alloc] init];
    tuanG.hidesBottomBarWhenPushed = YES;
    
    //传递数据
    tuanG.selectedCity = [SLBaseData sharedSLBaseData].currentCity;
    NSArray *temp = self.catagory[indexPath.section];
    tuanG.selectedCategory = temp[indexPath.row];
    
    [self.navigationController pushViewController:tuanG animated:YES];
}


@end








