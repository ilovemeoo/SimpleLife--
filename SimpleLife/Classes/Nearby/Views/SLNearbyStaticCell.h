//
//  SLNearbyStaticCell.h
//  SimpleLife
//
//  Created by xhp on 15/11/5.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLNearbyCatagory.h"

@interface SLNearbyStaticCell : UITableViewCell

@property (nonatomic,strong) SLNearbyCatagory *catagoryModel;
/**
 *  控制分割线显示
 */
@property (nonatomic,assign) BOOL seperator;
/**
 *  创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
