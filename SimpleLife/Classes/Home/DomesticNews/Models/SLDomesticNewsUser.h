//
//  SLDomesticNewsUser.h
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLDomesticNewsUser : NSObject

+ (void)getDomesticNewsWithPage:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
