//
//  SLHotNewsUser.m
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import "SLHotNewsUser.h"
#import "SLHotNewsParams.h"
#import "SLNearbyKey.h"
#import "SLHttpTool.h"
#import "SLHotNewsResult.h"
#import "SLPageBean.h"

#import "MJExtension.h"

@implementation SLHotNewsUser

+ (void)getHotNewsWithPage:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure
{
    SLHotNewsParams *params = [[SLHotNewsParams alloc] init];
    params.page = [NSNumber numberWithInt:page];
    
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/showapi_open_bus/channel_news/search_news" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        //NSLog(@"%@",responseObject[@"showapi_res_body.pagebean"]);
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







