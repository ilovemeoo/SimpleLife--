//
//  SLJokesCell.h
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLJokesFrame.h"

@interface SLJokesCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLJokesFrame *jokesF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
