//
//  SLDomesticNewsUser.m
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import "SLTechnologicalNewsUser.h"
#import "SLTechnologicalNewsParams.h"
#import "SLNearbyKey.h"
#import "SLHttpTool.h"
#import "SLHotNewsResult.h"
#import "SLPageBean.h"

#import "MJExtension.h"

@implementation SLTechnologicalNewsUser

+(void)getTechnologicalNewsWithPage:(int)page success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    SLTechnologicalNewsParams *params = [[SLTechnologicalNewsParams alloc] init];
    params.page = [NSNumber numberWithInt:page];
    
    params.channelId = @"5572a108b3cdc86cf39001d9";
    
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/showapi_open_bus/channel_news/search_news" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        //NSLog(@"%@",responseObject);
        SLHotNewsResult *result = [SLHotNewsResult objectWithKeyValues:responseObject[@"showapi_res_body"]];
        
        SLPageBean *pageBean = [SLPageBean objectWithKeyValues:result.pagebean];
        
        if (success) {
            success(pageBean.contentlist);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end