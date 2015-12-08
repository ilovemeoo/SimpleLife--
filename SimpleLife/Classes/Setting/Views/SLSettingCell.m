//
//  SLSettingCell.m
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSettingCell.h"

@interface SLSettingCell ()

@property (nonatomic,weak)  UILabel *lblTitle;
@property (nonatomic,weak)  UIImageView *imageV;

@end

@implementation SLSettingCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"settingCell";
    id cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 创建cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有子控件
        [self setUpAllChildView];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpAllChildView
{
    //图片
    CGFloat imageHW = 22;
    CGFloat imageX = 20;
    CGFloat imageY = 11;
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageHW, imageHW)];
    _imageV = imageV;
    [self addSubview:imageV];
    
    //标题
    CGFloat titleW = 150;
    CGFloat titleH = 24;
    CGFloat titleX = CGRectGetMaxX(imageV.frame) + 20;
    CGFloat titleY = 10;
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
    lblTitle.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1.0];
    lblTitle.font = [UIFont systemFontOfSize:16];
    _lblTitle = lblTitle;
    [self addSubview:lblTitle];
}

#pragma mark - 设置数据
- (void)setCatagoryModel:(SLSettingCategory *)catagoryModel
{
    _catagoryModel = catagoryModel;
    
    self.lblTitle.text = catagoryModel.title;
    
    self.imageV.image = [UIImage imageNamed:catagoryModel.icon];

}

@end









