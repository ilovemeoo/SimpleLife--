//
//  SLWeixinUser.m
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLWeixinUser.h"
#import "SLWeixinParams.h"
#import "SLHttpTool.h"
#import "SLWeixinResult.h"

#import "MJExtension.h"

@implementation SLWeixinUser

+ (void)newWeixinWithPno:(int)pno success:(void(^)(SLWeixinResult *result))success failure:(void(^)(NSError *error))failure
{
    SLWeixinParams *params = [[SLWeixinParams alloc] init];
    params.key = @"16ea8dd252917a75a5c479b7cc06119d";
    pno++;
    params.pno = pno;

    //发送请求
    [SLHttpTool GET:@"http://v.juhe.cn/weixin/query" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLWeixinResult *result = [SLWeixinResult objectWithKeyValues:responseObject[@"result"]];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end






