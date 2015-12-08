//
//  SLSubCategory.m
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSubCategory.h"

@implementation SLSubCategory

- (instancetype)initWithDict:(NSDictionary *) dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)subcategoryWithDict:(NSDictionary *) dict
{
   return [[self alloc] initWithDict:dict];
}

@end
