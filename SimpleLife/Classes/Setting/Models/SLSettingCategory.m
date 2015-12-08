//
//  SLSettingCategory.m
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSettingCategory.h"

@implementation SLSettingCategory

- (instancetype)initWithDictionary:(NSDictionary *) dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)settingWithDictionary:(NSDictionary *) dic
{
    return [[self alloc] initWithDictionary:dic];
}

@end
