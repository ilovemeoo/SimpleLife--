//
//  SLPerCity.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLPerCity.h"

@implementation SLPerCity

- (instancetype)initWithDictionary:(NSDictionary *) dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)cityWithDictionary:(NSDictionary *) dic
{
    return [[self alloc] initWithDictionary:dic];
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.short_name forKey:@"short_name"];
    [aCoder encodeObject:self.city_id forKey:@"city_id"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.short_name = [aDecoder decodeObjectForKey:@"short_name"];
        self.city_id = [aDecoder decodeObjectForKey:@"city_id"];
    }
    return self;
}



@end
