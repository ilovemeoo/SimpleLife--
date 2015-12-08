//
//  SLPageBean.m
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import "SLPageBean.h"
#import "SLHotNews.h"

@implementation SLPageBean

+ (NSDictionary *)objectClassInArray
{
    return @{@"contentlist":[SLHotNews class]};
}

@end
