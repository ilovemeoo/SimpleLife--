//
//  SLJokeResult.m
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLJokeResult.h"
#import "SLJoke.h"

@implementation SLJokeResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[SLJoke class]};
}

@end
