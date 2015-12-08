//
//  SLIPAdressUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLIPAdressUser.h"
#import "SLIPAdressParams.h"
#import "SLHttpTool.h"

#import "MJExtension.h"

@implementation SLIPAdressUser

+ (void)searchWithIP:(NSString *)ip success:(void(^)(SLIPAdress *result))success failure:(void(^)(NSError *error))failure
{
    SLIPAdressParams *params = [[SLIPAdressParams alloc] init];
    params.key = @"509f1bfa87d825ce27204d2d8a385995";
    params.ip = ip;
    
    //发送请求
    [SLHttpTool GET:@"http://apis.juhe.cn/ip/ip2addr" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLIPAdress *result = [SLIPAdress objectWithKeyValues:responseObject[@"result"]];
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
