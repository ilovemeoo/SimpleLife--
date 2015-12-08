//
//  SLHotNewsFrame.h
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLHotNews.h"

@interface SLHotNewsFrame : NSObject

/**
 *  模型
 */
@property (nonatomic,strong) SLHotNews *hotNews;

//*************************************************
/**
 *  标题Frame
 */
@property (nonatomic,assign) CGRect titleFrame;
/**
 *  来源Frame
 */
@property (nonatomic,assign) CGRect sourceFrame;
/**
 *  时间Frame
 */
@property (nonatomic,assign) CGRect pubDateFrame;
/**
 *  图片Frame
 */
@property (nonatomic,assign) CGRect imageFrame;
/**
 *  分割线Frame
 */
@property (nonatomic,assign) CGRect viewFrame;

//*************************************************
/**
 *  单元格高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end








