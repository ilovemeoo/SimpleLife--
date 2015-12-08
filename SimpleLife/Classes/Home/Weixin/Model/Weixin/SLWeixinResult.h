//
//  SLWeixinResult.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLWeixinResult : NSObject

@property (nonatomic,strong) NSArray *list;

/**
 *  总页数
 */
@property (nonatomic,assign) int totalPage;
/**
 *  当前页数
 */
@property (nonatomic,assign) int pno;

@end
