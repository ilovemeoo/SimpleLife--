//
//  SLDomesticNewsCell.h
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLFinantialNewsFrame.h"

@interface SLFinantialNewsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLFinantialNewsFrame *finantialNewsF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
