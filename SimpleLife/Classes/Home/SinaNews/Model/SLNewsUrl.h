//
//  SLNewsUrl.h
//  SimpleLife
//
//  Created by xhp on 15/11/6.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNewsUrl : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *) dic;
+ (instancetype)newsWithDictionary:(NSDictionary *) dic;

@end
