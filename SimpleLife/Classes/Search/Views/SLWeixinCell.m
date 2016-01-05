//
//  SLWeixinCell.m
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLWeixinCell.h"
#import "UIImageView+WebCache.h"

@interface SLWeixinCell ()

@property (nonatomic,weak)  UILabel *lblSource;
@property (nonatomic,weak)  UILabel *lblTitle;
@property (nonatomic,weak)  UIImageView *imageV;
@property (nonatomic,weak)  UIView *seperator;

@end

@implementation SLWeixinCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"weixin";
    id cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 创建cell
//注意：cell是用此方法初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

- (void)setUpAllChildView
{
    //来源
    UILabel *lblSource = [[UILabel alloc] init];
    lblSource.font = [UIFont systemFontOfSize:13];
    lblSource.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    _lblSource = lblSource;
    [self addSubview:lblSource];
    
    //标题
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
    lblTitle.numberOfLines = 0;
    lblTitle.font = [UIFont systemFontOfSize:16];
    _lblTitle = lblTitle;
    [self addSubview:lblTitle];
    
    //图片
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV = imageV;
    [self addSubview:imageV];
    
    //分割线
    UIView *seperator = [[UIView alloc] init];
    seperator.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    _seperator = seperator;
    [self addSubview:seperator];
    
}

#pragma mark - 设置数据
-(void)setWeixinF:(SLWeixinFrame *)weixinF
{
    _weixinF = weixinF;
    
    //传递数据
    self.lblSource.frame = weixinF.hottimeFrame;
    self.lblSource.text = weixinF.weixin.hottime;
    
    self.lblTitle.frame = weixinF.titleFrame;
    self.lblTitle.text = weixinF.weixin.title;
    
    self.imageV.frame = weixinF.firstImgFrame;
    [self.imageV sd_setImageWithURL:weixinF.weixin.picUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    self.seperator.frame = CGRectMake(10, weixinF.cellHeight - 0.5, [UIScreen mainScreen].bounds.size.width - 20, 0.5);
}

@end












