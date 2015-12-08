//
//  SLDealUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLDealUser.h"
#import "SLDealParams.h"
#import "SLNearbyKey.h"
#import "SLHttpTool.h"
#import "SLDealResult.h"

#import "MJExtension.h"
#import "SLDeal.h"
@implementation SLDealUser

+ (void)getDealWithCityId:(NSNumber *)city_id districtId:(NSNumber *)district_id categoryId:(NSNumber *)category_id subCategoryId:(NSNumber *)subCategory_id page:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure
{
    SLDealParams *params = [[SLDealParams alloc] init];
    params.city_id = city_id;
    params.district_ids = district_id;
    params.cat_ids = category_id;
    params.subcat_ids = subCategory_id;
    params.page = [NSNumber numberWithInt:page];
    
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/baidunuomi/openapi/searchdeals" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        
        SLDealResult *result = [SLDealResult objectWithKeyValues:responseObject[@"data"]];
        
        if (success) {
            success(result.deals);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}


@end








