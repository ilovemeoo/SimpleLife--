//
//  SLCityData.h
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "SLPerCity.h"

@interface SLBaseData : NSObject

singleton_interface(SLBaseData)

@property (nonatomic,strong) NSMutableArray *citiesArray;
/**
 *  所有城市
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *totalCities;
/**
 *  所有城市分组
 */
@property (nonatomic, strong, readonly) NSMutableArray *totalCitySections;
/**
 *  当前城市
 */
@property (nonatomic, strong) SLPerCity *currentCity;

@end
