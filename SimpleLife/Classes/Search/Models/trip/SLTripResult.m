//
//  SLTripResult.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripResult.h"
#import "SLTrip.h"

@implementation SLTripResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"books":[SLTrip class]};
}

@end
