//
//  SLDomesticNewsCell.h
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLMilitaryNewsFrame.h"

@interface SLMilitaryNewsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLMilitaryNewsFrame *militaryNewsF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
