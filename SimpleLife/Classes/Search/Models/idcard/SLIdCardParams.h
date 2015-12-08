//
//  SLIdCardParams.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLIdCardParams : NSObject

/**
 *  身份证号码
 */
@property (nonatomic,copy) NSString *cardno;
/**
 *  返回数据格式
 */
@property (nonatomic,copy) NSString *dtype;
/**
 *  应用key
 */
@property (nonatomic,copy) NSString *key;

@end
