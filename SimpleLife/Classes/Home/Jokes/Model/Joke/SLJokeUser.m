//
//  SLJokeUser.m
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLJokeUser.h"
#import "SLHttpTool.h"
#import "SLJokeParams.h"
#import "SLJokeMoreParams.h"
#import "SLJokeResult.h"

#import "MJExtension.h"
#define jokeKey @"f987c8385c9bb7e7df0ce7bed3fefb3c" 

@implementation SLJokeUser

#pragma mark - 最新趣图
+ (void)newJokesWithSuccess:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure
{
    SLJokeParams *params = [[SLJokeParams alloc] init];
    params.key = jokeKey;
    params.page = 1;
    params.pagesize = 10;
    
    //发送请求
    [SLHttpTool GET:@"http://japi.juhe.cn/joke/img/text.from" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLJokeResult *result = [SLJokeResult objectWithKeyValues:responseObject[@"result"]];
        
        if (success) {
            success(result.data);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 下拉刷新最新趣图
+ (void)newJokesWithTimeId:(NSString *)timeId sort:(NSString *)sort success:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure
{
    SLJokeMoreParams *params = [[SLJokeMoreParams alloc] init];
    params.key = jokeKey;
    params.page = 1;
    params.pagesize = 5;
    params.sort = sort;
    params.time = timeId;
    
    //发送请求
    [SLHttpTool GET:@"http://japi.juhe.cn/joke/img/list.from" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLJokeResult *result = [SLJokeResult objectWithKeyValues:responseObject[@"result"]];
        
        if (success) {
            success(result.data);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}


@end










