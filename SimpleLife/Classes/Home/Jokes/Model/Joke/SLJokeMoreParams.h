//
//  SLJokeMoreParams.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJokeMoreParams : NSObject

/**
 *  应用key
 */
@property (nonatomic,copy) NSString *key;
/**
 *  时间撮
 */
@property (nonatomic,copy) NSString *time;
/**
 *  类型
 */
@property (nonatomic,copy) NSString *sort;

/**
 *  返回页数
 */
@property (nonatomic,assign) int page;
/**
 *  每页最大条数
 */
@property (nonatomic,assign) int pagesize;


@end
