//
//  SLDomesticNewsCell.h
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLInterNationalNewsFrame.h"

@interface SLInterNationalNewsCell : UITableViewCell

/**
 *  数据模型
 */
@property (nonatomic,strong) SLInterNationalNewsFrame *interNationalNewsF;

/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
