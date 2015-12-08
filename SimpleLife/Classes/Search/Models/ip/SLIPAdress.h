//
//  SLIPAdress.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLIPAdress : NSObject

/**
 *  出错原因
 */
@property (nonatomic,copy) NSString *reason;
/**
 *  地区
 */
@property (nonatomic,copy) NSString *area;
/**
 *  位置
 */
@property (nonatomic,copy) NSString *location;

@end
