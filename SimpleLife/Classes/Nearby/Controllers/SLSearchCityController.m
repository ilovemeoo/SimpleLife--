//
//  SLSearchCityController.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSearchCityController.h"
#import "SLBaseData.h"
#import "SLPerCity.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"

@interface SLSearchCityController ()

@property (nonatomic, strong) NSMutableArray *resultCities;

@end

@implementation SLSearchCityController

#pragma mark - 懒加载
- (NSMutableArray *)resultCities
{
    if (_resultCities == nil) {
        _resultCities = [NSMutableArray array];
    }
    return _resultCities;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - set方法
- (void)setSearchText:(NSString *)searchText
{
    _searchText = searchText;
    
    //清除之前搜索结果
    [self.resultCities removeAllObjects];
    
    NSMutableArray *citiesArray = [SLBaseData sharedSLBaseData].citiesArray;
    
    if (searchText.length>0&&![ChineseInclude isIncludeChineseInString:searchText]) {
        for (int i=0; i<citiesArray.count; i++) {
            SLPerCity *city = [[SLPerCity alloc] init];
            city = citiesArray[i];
            if ([ChineseInclude isIncludeChineseInString:city.short_name]) {
                
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:city.short_name];
                NSRange titleResult=[tempPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.resultCities addObject:citiesArray[i]];
                }
                
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:city.short_name];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [self.resultCities addObject:citiesArray[i]];
                }

            }
            else {
                NSRange titleResult=[city.short_name rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.resultCities addObject:citiesArray[i]];
                }
            }
        }
    } else if (searchText.length>0&&[ChineseInclude isIncludeChineseInString:searchText]) {
        for (SLPerCity *city in citiesArray) {
            NSRange titleResult=[city.short_name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [self.resultCities addObject:city];
            }
        }
    }

    [self.tableView reloadData];
}

#pragma mark - Table view 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultCities.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"共%ld个搜索结果",(unsigned long)self.resultCities.count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"searchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    SLPerCity *city = self.resultCities[indexPath.row];
    cell.textLabel.text = city.short_name;
    return cell;
}

#pragma mark - tableview 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLPerCity *city = self.resultCities[indexPath.row];
    [SLBaseData sharedSLBaseData].currentCity = city;
    [self.navigationController popViewControllerAnimated:YES];
}

@end











