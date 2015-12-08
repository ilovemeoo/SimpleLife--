//
//  SLBankCardUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLBankCard.h"

@interface SLBankCardUser : NSObject

+ (void)searchWithBankCardNo:(NSString *)cardNo success:(void(^)(SLBankCard *result))success failure:(void(^)(NSError *error))failure;

@end
