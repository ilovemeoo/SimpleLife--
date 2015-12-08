//
//  SLPerCity.h
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLPerCity : NSObject

@property (nonatomic,strong) NSNumber *city_id;
@property (nonatomic,copy) NSString *short_name;

- (instancetype)initWithDictionary:(NSDictionary *) dic;
+ (instancetype)cityWithDictionary:(NSDictionary *) dic;

@end
