//
//  SLHotNewsCell.h
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLHotNewsFrame.h"

@interface SLHotNewsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLHotNewsFrame *hotNewsF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
