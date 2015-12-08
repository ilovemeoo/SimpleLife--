//
//  SLNearbyCatagory.m
//  SimpleLife
//
//  Created by xhp on 15/11/4.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNearbyCatagory.h"
#import "SLSubCategory.h"

@implementation SLNearbyCatagory

- (instancetype)initWithDictionary:(NSDictionary *) dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *subDict in self.subcategories) {
            SLSubCategory *subCategory = [SLSubCategory subcategoryWithDict:subDict];
            [arrayM addObject:subCategory];
        }
        self.subcategories = arrayM;
    }
    return self;
}
+ (instancetype)catagoryWithDictionary:(NSDictionary *) dic
{
    return [[self alloc] initWithDictionary:dic];
}

@end



