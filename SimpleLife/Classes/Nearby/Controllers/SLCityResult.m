//
//  SLCityResult.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLCityResult.h"
#import "SLCity.h"

@implementation SLCityResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"districts":[SLCity class]};
}

@end
