//
//  SLSettingCategory.h
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLSettingCategory : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *) dic;
+ (instancetype)settingWithDictionary:(NSDictionary *) dic;

@end
