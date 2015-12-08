//
//  SLCityUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLCityUser : NSObject

+ (void)getCityWithCityId:(NSNumber *)city_id success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
