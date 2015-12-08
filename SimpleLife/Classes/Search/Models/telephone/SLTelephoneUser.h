//
//  SLTelephoneUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTelephone.h"

@interface SLTelephoneUser : NSObject

+ (void)searchWithPhoneNo:(int )phone success:(void(^)(SLTelephone *result))success failure:(void(^)(NSError *error))failure;

@end
