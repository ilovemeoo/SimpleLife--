//
//  SLNewsUrl.m
//  SimpleLife
//
//  Created by xhp on 15/11/6.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNewsUrl.h"

@implementation SLNewsUrl

- (instancetype)initWithDictionary:(NSDictionary *) dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)newsWithDictionary:(NSDictionary *) dic
{
    return [[self alloc] initWithDictionary:dic];
}

@end
