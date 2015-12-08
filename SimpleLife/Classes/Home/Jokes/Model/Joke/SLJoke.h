//
//  SLJoke.h
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJoke : NSObject

/**
 *  正文
 */
@property (nonatomic,copy) NSString *content;
/**
 *  更新时间
 */
@property (nonatomic,copy) NSString *updatetime;
/**
 *  url
 */
@property (nonatomic,strong) NSURL *url;
/**
 *  时间撮
 */
@property (nonatomic,copy) NSString *unixtime;

@end
