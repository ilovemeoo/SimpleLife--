//
//  SLWeixinResult.m
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLWeixinResult.h"
#import "SLWeixin.h"

@implementation SLWeixinResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"list":[SLWeixin class]};
}

@end
