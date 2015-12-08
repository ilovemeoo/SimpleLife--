//
//  SLIdCard.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLIdCard : NSObject

/**
 *  地区
 */
@property (nonatomic,copy) NSString *area;
/**
 *  性别
 */
@property (nonatomic,copy) NSString *sex;
/**
 *  出生日期
 */
@property (nonatomic,copy) NSString *birthday;
/**
 *  返回类型
 */
@property (nonatomic,copy) NSString *reason;

@end
