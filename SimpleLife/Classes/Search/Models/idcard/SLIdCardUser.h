//
//  SLIdCardUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLIdCard.h"

@interface SLIdCardUser : NSObject

+ (void)searchWithIdCardNo:(NSString *)cardNo success:(void(^)(SLIdCard *result))success failure:(void(^)(NSError *error))failure;

@end
