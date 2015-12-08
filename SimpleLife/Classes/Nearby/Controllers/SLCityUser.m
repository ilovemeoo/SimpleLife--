//
//  SLCityUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLCityUser.h"
#import "SLHttpTool.h"
#import "SLNearbyKey.h"
#import "SLCityParams.h"
#import "SLCityResult.h"

#import "MJExtension.h"

@implementation SLCityUser

+ (void)getCityWithCityId:(NSNumber *)city_id success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    SLCityParams *params = [[SLCityParams alloc] init];
    params.city_id = city_id;
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/baidunuomi/openapi/districts" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        
        SLCityResult *result = [SLCityResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.districts);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end






