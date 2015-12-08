//
//  SLTripResult.h
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTripResult : NSObject

/**
 *  结果总数
 */
@property (nonatomic,strong) NSNumber *count;

/**
 *  数据列表
 */
@property (nonatomic,strong) NSArray *books;

@end
