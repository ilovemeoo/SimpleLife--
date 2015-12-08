//
//  SLDealResult.m
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLDealResult.h"
#import "SLDeal.h"

@implementation SLDealResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"deals":[SLDeal class]};
}

@end
