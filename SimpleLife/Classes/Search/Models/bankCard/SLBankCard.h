//
//  SLBankCard.h
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLBankCard : NSObject

/**
 *  银行卡的类型
 */
@property (nonatomic,copy) NSString *cardtype;
/**
 *  银行卡前缀
 */
@property (nonatomic,copy) NSString *cardprefixnum;
/**
 *  银行卡名称
 */
@property (nonatomic,copy) NSString *cardname;
/**
 *  归属银行
 */
@property (nonatomic,copy) NSString *bankname;
/**
 *  返回状态
 */
@property (nonatomic,strong) NSNumber *status;

@end

