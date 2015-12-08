//
//  SLTripUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTripUser : NSObject

+ (void)getTripListWithPage:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
