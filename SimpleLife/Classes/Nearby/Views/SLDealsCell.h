//
//  SLDealsCell.h
//  SimpleLife
//
//  Created by xhp on 15/11/9.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLDealsFrame.h"

@interface SLDealsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLDealsFrame *dealF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
