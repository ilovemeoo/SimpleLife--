//
//  SLWeixinFrame.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLWeixin.h"

@interface SLWeixinFrame : NSObject

/**
 *  模型
 */
@property (nonatomic,strong) SLWeixin *weixin;

//***************************************************
/**
 *  来源frame
 */
@property (nonatomic,assign) CGRect sourceFrame;
/**
 *  标题frame
 */
@property (nonatomic,assign) CGRect titleFrame;
/**
 *  图片frame
 */
@property (nonatomic,assign) CGRect firstImgFrame;

//**************************************************
/**
 *  单元格高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end







