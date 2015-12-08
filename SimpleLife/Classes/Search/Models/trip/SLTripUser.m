//
//  SLTripUser.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripUser.h"
#import "SLTripParams.h"
#import "SLNearbyKey.h"
#import "SLHttpTool.h"
#import "SLTripResult.h"

#import "MJExtension.h"

@implementation SLTripUser

+ (void)getTripListWithPage:(int)page success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    SLTripParams *params = [[SLTripParams alloc] init];
    params.page = [NSNumber numberWithInt:page];
    
    SLNearbyKey *apiKey = [[SLNearbyKey alloc] init];
    
    //发送请求
    [SLHttpTool GET:@"http://apis.baidu.com/qunartravel/travellist/travellist" headerField:apiKey.apikey parameters:params.keyValues success:^(id responseObject) {
        
        SLTripResult *result = [SLTripResult objectWithKeyValues:responseObject[@"data"]];
        
        if (success) {
            success(result.books);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end






