//
//  SLDomesticNewsCell.h
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLDomesticNewsFrame.h"

@interface SLDomesticNewsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLDomesticNewsFrame *domesticNewsF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
