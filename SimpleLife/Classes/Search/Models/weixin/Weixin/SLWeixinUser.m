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
#import "SLWeixin.h"
#import "SLNearbyKey.h"

#import "MJExtension.h"

@implementation SLWeixinUser

+ (void)newWeixinWithPno:(int)pno success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure
{
    SLWeixinParams *params = [[SLWeixinParams alloc] init];
    params.num = @10;
    params.page = [NSNumber numberWithInt:pno];
    
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/txapi/weixin/wxhot" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        
        NSMutableArray *result = [NSMutableArray array];
        //模型方法，字典转模型
        for (int i = 0; i < 10 ; i++) {
            SLWeixin *weixin = [SLWeixin objectWithKeyValues:responseObject[[NSString stringWithFormat:@"%d",i]]];
            [result addObject:weixin];
        }

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






