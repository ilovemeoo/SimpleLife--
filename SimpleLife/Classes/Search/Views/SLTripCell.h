//
//  SLTripCell.h
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLTripFrame.h"

@interface SLTripCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLTripFrame *tripF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
