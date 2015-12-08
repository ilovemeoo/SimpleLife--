//
//  SLIPAdressUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLIPAdress.h"

@interface SLIPAdressUser : NSObject

+ (void)searchWithIP:(NSString *)ip success:(void(^)(SLIPAdress *result))success failure:(void(^)(NSError *error))failure;

@end
