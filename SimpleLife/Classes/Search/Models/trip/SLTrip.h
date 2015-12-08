//
//  SLTrip.h
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTrip : NSObject

/**
 *  链接
 */
@property (nonatomic,copy) NSString *bookUrl;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  标题图片
 */
@property (nonatomic,copy) NSString *headImage;
/**
 *  用户名
 */
@property (nonatomic,copy) NSString *userName;
/**
 *  用户头像
 */
@property (nonatomic,copy) NSString *userHeadImg;
/**
 *  开始时间
 */
@property (nonatomic,copy) NSString *startTime;
/**
 *  持续时间
 */
@property (nonatomic,copy) NSString *routeDays;



@end







