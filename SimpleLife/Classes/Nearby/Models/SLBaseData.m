//
//  SLCityData.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLBaseData.h"
#import "PinYinForObjc.h"

#define SLVisitedCity [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"visitedCityNames.data"]

@interface SLBaseData ()

@property (nonatomic,strong) NSMutableArray *hotcitiesArray;
@property (nonatomic,strong) NSMutableArray *visitedCity;

@end
@implementation SLBaseData

#pragma mark - 单例对象
singleton_implementation(SLBaseData)

#pragma mark - 懒加载
- (NSMutableArray *)hotcitiesArray
{
    if (_hotcitiesArray == nil) {
        NSArray *tempArray = [[NSArray  alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nuomi_cities_hot" ofType:@"plist"]];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in tempArray) {
            SLPerCity *city = [SLPerCity cityWithDictionary:dic];
            [array addObject:city];
        }
        _hotcitiesArray = array;
    }
    return _hotcitiesArray;
}

- (NSMutableArray *)citiesArray
{
    if (_citiesArray == nil) {
        NSArray *tempArray = [[NSArray  alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nuomi_cities" ofType:@"plist"]];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in tempArray) {
            SLPerCity *city = [SLPerCity cityWithDictionary:dic];
            [array addObject:city];
        }
        _citiesArray = array;
    }
    return _citiesArray;
}

- (NSMutableArray *)visitedCity
{
    if (_visitedCity == nil) {
        _visitedCity = [NSMutableArray array];
    }
    return _visitedCity;
}

#pragma mark - 初始化
- (id)init
{
    if (self = [super init]) {
    
        //初始化城市列表
        [self initCityData];
        
    }
    return self;
}

- (void)initCityData
{
    NSMutableDictionary *citiesDict=[[NSMutableDictionary alloc] init];
    NSString *pinyin=nil;
    NSMutableArray *array=nil;
    
    //A~Z
    for (SLPerCity *city in self.citiesArray) {
        
        pinyin=[[PinYinForObjc chineseConvertToPinYin:city.short_name] substringToIndex:1];
        
        //如果包含key
        if([[citiesDict allKeys] containsObject:pinyin]){
            array = [citiesDict objectForKey:pinyin];
            [array addObject:city];
            [citiesDict setObject:array forKey:pinyin];
        }else{
            array= [[NSMutableArray alloc] initWithObjects:city, nil];
            [citiesDict setObject:array forKey:pinyin];
        }  
    }
    
    //热门
    NSMutableArray *sections = [NSMutableArray arrayWithArray:[[citiesDict allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    [sections insertObject:@"热门" atIndex:0];
    [citiesDict setObject:self.hotcitiesArray forKey:@"热门"];
    
    //最近
    self.visitedCity = [NSKeyedUnarchiver unarchiveObjectWithFile:SLVisitedCity];

    if (self.visitedCity.count) {
        [sections insertObject:@"最近" atIndex:0];
        [citiesDict setObject:self.visitedCity forKey:@"最近"];
    }

    if (self.visitedCity.count > 0) {
        //当前城市
        _currentCity = self.visitedCity.firstObject;
    }
    if (_currentCity == nil) {
        // 添加默认城市
        _currentCity = self.hotcitiesArray[0];
    }
    
    _totalCitySections = sections;
    _totalCities = citiesDict;
}

#pragma mark - 属性set方法
- (void)setCurrentCity:(SLPerCity *)currentCity
{
    _currentCity = currentCity;
    
    //1.移除之前的城市名
    [self.visitedCity removeObject:currentCity];
    
    //2.将新的城市名放到最前面
    [self.visitedCity insertObject:currentCity atIndex:0];
    
    [NSKeyedArchiver archiveRootObject:self.visitedCity toFile:SLVisitedCity];
    
    //发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"city_change" object:nil];
    
}

@end












