//
//  SLWeixinUser.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLWeixinUser : NSObject

+ (void)newWeixinWithPno:(int)pno success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
