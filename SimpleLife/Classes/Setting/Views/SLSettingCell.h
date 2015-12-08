//
//  SLSettingCell.h
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLSettingCategory.h"

@interface SLSettingCell : UITableViewCell

@property (nonatomic,strong) SLSettingCategory *catagoryModel;
/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
