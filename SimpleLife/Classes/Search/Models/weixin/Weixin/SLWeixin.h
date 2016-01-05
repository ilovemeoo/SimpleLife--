//
//  SLWeixin.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLWeixin : NSObject

/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  时间
 */
@property (nonatomic,copy) NSString *hottime;
/**
 *  图片
 */
@property (nonatomic,strong) NSURL *picUrl;
/**
 *  网页地址
 */
@property (nonatomic,strong) NSString *url;

@end
