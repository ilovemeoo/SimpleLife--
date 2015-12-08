//
//  SLBankCardUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLBankCardUser.h"
#import "SLBankCardParams.h"
#import "SLNearbyKey.h"
#import "SLHttpTool.h"

#import "MJExtension.h"

@implementation SLBankCardUser

+ (void)searchWithBankCardNo:(NSString *)cardNo success:(void (^)(SLBankCard *))success failure:(void (^)(NSError *))failure
{
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];//百度数据接口
    
    SLBankCardParams *params = [[SLBankCardParams alloc] init];
    params.cardnum = cardNo;

    [SLHttpTool GET:@"http://apis.baidu.com/datatiny/cardinfo/cardinfo" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {

        SLBankCard *result = [SLBankCard objectWithKeyValues:responseObject[@"data"]];
        result.status = responseObject[@"status"];
        
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










