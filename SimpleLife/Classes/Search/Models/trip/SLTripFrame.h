//
//  SLTripFrame.h
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLTrip.h"

@interface SLTripFrame : NSObject

/**
 *  模型
 */
@property (nonatomic,strong) SLTrip *trip;

//*************************************************
/**
 *  标题图片Frame
 */
@property (nonatomic,assign) CGRect headImageFrame;
/**
 *  coverFrame
 */
@property (nonatomic,assign) CGRect coverFrame;
/**
 *  头像Frame
 */
@property (nonatomic,assign) CGRect userHeadImgFrame;
/**
 *  标题Frame
 */
@property (nonatomic,assign) CGRect titleFrame;
/**
 *  用户名Frame
 */
@property (nonatomic,assign) CGRect userNameFrame;
/**
 *  开始时间Frame
 */
@property (nonatomic,assign) CGRect startTimeFrame;
/**
 *  持续时间Frame
 */
@property (nonatomic,assign) CGRect routeDaysFrame;

//*************************************************
/**
 *  单元格高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end








