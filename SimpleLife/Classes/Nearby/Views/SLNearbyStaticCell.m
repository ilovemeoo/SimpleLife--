//
//  SLNearbyStaticCell.m
//  SimpleLife
//
//  Created by xhp on 15/11/5.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNearbyStaticCell.h"

@interface SLNearbyStaticCell ()

@property (nonatomic,weak)  UILabel *lblTitle;
@property (nonatomic,weak)  UIImageView *imageV;
@property (nonatomic,weak)  UIView *seperatorLine;

@end

@implementation SLNearbyStaticCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"NearbyStaticCell";
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
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    
    //分割线
    UIView *seperatorLine = [[UIView alloc] initWithFrame:CGRectMake( 10, self.bounds.size.height - 1, [UIScreen mainScreen].bounds.size.width - 20, 1)];
    seperatorLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    _seperatorLine = seperatorLine;
    [self addSubview:seperatorLine];
    
}

#pragma mark - 设置数据
- (void)setCatagoryModel:(SLNearbyCatagory *)catagoryModel
{
    _catagoryModel = catagoryModel;
    
    self.lblTitle.text = catagoryModel.cat_name;
    
    self.imageV.image = [UIImage imageNamed:catagoryModel.cat_image];
    
    self.seperatorLine.hidden = !self.seperator;
}

@end











