//
//  WBHttpTool.h
//  sinaWeibo
//
//  Created by xhp on 15/10/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//  处理网络请求

#import <Foundation/Foundation.h>

@interface SLHttpTool : NSObject

//不带headerfield
+ (void)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;


//带headerfield
+ (void)GET:(NSString *)URLString
headerField:(NSString *)headerField
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

@end







