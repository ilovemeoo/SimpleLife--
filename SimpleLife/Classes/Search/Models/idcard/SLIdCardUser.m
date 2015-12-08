//
//  SLIdCardUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLIdCardUser.h"
#import "SLIdCard.h"
#import "SLIdCardParams.h"
#import "SLHttpTool.h"

#import "MJExtension.h"

@implementation SLIdCardUser

+ (void)searchWithIdCardNo:(NSString *)cardNo success:(void(^)(SLIdCard *result))success failure:(void(^)(NSError *error))failure
{
    SLIdCardParams *params = [[SLIdCardParams alloc] init];
    params.key = @"2fbabe7913b7d34b5c78807c8c9d3534";
    params.cardno = cardNo;
    params.dtype = @"json";
    
    //发送请求
    [SLHttpTool GET:@"http://apis.juhe.cn/idcard/index" parameters:params.keyValues success:^(id responseObject) {
        //模型方法，字典转模型
        SLIdCard *result = [SLIdCard objectWithKeyValues:responseObject[@"result"]];
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







