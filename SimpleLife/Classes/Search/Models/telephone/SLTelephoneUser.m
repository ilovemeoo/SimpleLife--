//
//  SLTelephoneUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTelephoneUser.h"
#import "SLTelephoneParams.h"
#import "SLHttpTool.h"

#import "MJExtension.h"

@implementation SLTelephoneUser

+ (void)searchWithPhoneNo:(int )phone success:(void(^)(SLTelephone *result))success failure:(void(^)(NSError *error))failure
{
    SLTelephoneParams *params = [[SLTelephoneParams alloc] init];
    params.key = @"4fcd369506d4da71c379006dc5d1b4a7";
    params.phone = phone;
    
    //发送请求
    [SLHttpTool GET:@"http://apis.juhe.cn/mobile/get" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLTelephone *result = [SLTelephone objectWithKeyValues:responseObject[@"result"]];
        result.reason = responseObject[@"reason"];
        
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







