//
//  SLJokesFrame.h
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLJoke.h"

@interface SLJokesFrame : NSObject

/**
 *  模型
 */
@property (nonatomic,strong) SLJoke *joke;

//***************************************************
/**
 *  单元格frame
 */
@property (nonatomic,assign) CGRect viewFrame;
/**
 *  时间frame
 */
@property (nonatomic,assign) CGRect updateTimeFrame;
/**
 *  内容frame
 */
@property (nonatomic,assign) CGRect contentFrame;
/**
 *  图片frame
 */
@property (nonatomic,assign) CGRect imageFrame;

//**************************************************
/**
 *  单元格高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end











