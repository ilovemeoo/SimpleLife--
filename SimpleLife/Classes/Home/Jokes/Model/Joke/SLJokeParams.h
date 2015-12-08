//
//  WBUserParams.h
//  sinaWeibo
//
//  Created by xhp on 15/10/11.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJokeParams : NSObject

/**
 *  应用key
 */
@property (nonatomic,copy) NSString *key;
/**
 *  返回页数
 */
@property (nonatomic,assign) int page;

/**
 *  每页最大条数
 */
@property (nonatomic,assign) int pagesize;

@end
