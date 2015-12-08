//
//  SLDealsFrame.h
//  SimpleLife
//
//  Created by xhp on 15/11/9.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLDeal.h"

@interface SLDealsFrame : NSObject

/**
 *  模型
 */
@property (nonatomic,strong) SLDeal *deal;

//***************************************************
/**
 *  单元格frame
 */
@property (nonatomic,assign) CGRect viewFrame;
/**
 *  分割线frame
 */
@property (nonatomic,assign) CGRect seperatorFrame;
/**
 *  图片frame
 */
@property (nonatomic,assign) CGRect tiny_imageFrame;
/**
 *  商店名frame
 */
@property (nonatomic,assign) CGRect titleFrame;
/**
 *  评论数frame
 */
@property (nonatomic,assign) CGRect comment_numFrame;
/**
 *  描述frame
 */
@property (nonatomic,assign) CGRect descriptionFrame;
/**
 *  市场价frame
 */
@property (nonatomic,assign) CGRect market_priceFrame;
/**
 *  现价frame
 */
@property (nonatomic,assign) CGRect current_priceFrame;
/**
 *  售出数量frame
 */
@property (nonatomic,assign) CGRect sale_numFrame;
/**
 *  得分frame
 */
@property (nonatomic,assign) CGRect scoreFrame;
/**
 *  预约frame
 */
@property (nonatomic,assign) CGRect reservationFrame;

//**************************************************
/**
 *  单元格高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end








