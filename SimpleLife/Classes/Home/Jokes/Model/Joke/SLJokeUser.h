//
//  SLJokeUser.h
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJokeUser : NSObject

/**
 *  查询最新趣图
 *
 */
+ (void)newJokesWithSuccess:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure;

/**
 *  刷新最新趣图
 */
+ (void)newJokesWithTimeId:(NSString *)timeId sort:(NSString *)sort success:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure;

@end
