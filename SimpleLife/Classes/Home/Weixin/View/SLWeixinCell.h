//
//  SLWeixinCell.h
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLWeixinFrame.h"

@interface SLWeixinCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLWeixinFrame *weixinF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
