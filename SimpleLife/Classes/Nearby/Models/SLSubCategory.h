//
//  SLSubCategory.h
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLSubCategory : NSObject

@property (nonatomic,strong) NSNumber *subcat_id;
@property (nonatomic,copy) NSString *subcat_name;

- (instancetype)initWithDict:(NSDictionary *) dict;
+ (instancetype)subcategoryWithDict:(NSDictionary *) dict;

@end
