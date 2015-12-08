//
//  WBHttpTool.m
//  sinaWeibo
//
//  Created by xhp on 15/10/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLHttpTool.h"
#import "AFNetworking.h"

@implementation SLHttpTool

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //发送请求
    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)GET:(NSString *)URLString headerField:(NSString *)headerField parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr.requestSerializer setValue:headerField forHTTPHeaderField:@"apikey"];
    //发送请求
    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end







