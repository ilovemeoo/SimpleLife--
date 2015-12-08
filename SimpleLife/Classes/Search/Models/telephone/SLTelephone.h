//
//  SLTelephone.h
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTelephone : NSObject

/**
 *  省份
 */
@property (nonatomic,copy) NSString *province;
/**
 *  城市
 */
@property (nonatomic,copy) NSString *city;
/**
 *  运营公司
 */
@property (nonatomic,copy) NSString *company;
/**
 *  卡类型
 */
@property (nonatomic,copy) NSString *card;

/**
 *  原因
 */
@property (nonatomic,copy) NSString *reason;

@end
