//
//  SLHotNewsUser.h
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLHotNewsUser : NSObject

+ (void)getHotNewsWithPage:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
