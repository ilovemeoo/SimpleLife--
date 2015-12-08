//
//  SLDeal.h
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLDeal : NSObject

/**
 *  团单id
 */
@property (nonatomic,strong) NSNumber *deal_id;
/**
 *  小图片
 */
@property (nonatomic,copy) NSString *tiny_image;
/**
 *  商店名
 */
@property (nonatomic,copy) NSString *title;
/**
 *  描述
 */
@property (nonatomic,copy) NSString *description;
/**
 *  市场价
 */
@property (nonatomic,strong) NSNumber *market_price;
/**
 *  现价
 */
@property (nonatomic,strong) NSNumber *current_price;
/**
 *  售出
 */
@property (nonatomic,strong) NSNumber *sale_num;
/**
 *  得分
 */
@property (nonatomic,copy) NSString *score;
/**
 *  网址url
 */
@property (nonatomic,copy) NSString *deal_murl;
/**
 *  是否预约
 */
@property (nonatomic,assign) BOOL is_reservation_required;
/**
 *  评论数
 */
@property (nonatomic,strong) NSNumber *comment_num;

@end






