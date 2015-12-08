//
//  SLTripCell.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripCell.h"
#import "UIImageView+WebCache.h"
#import "SLTripCountBtn.h"

#define SLTitleFont [UIFont boldSystemFontOfSize:18]
#define SLDetailFont [UIFont systemFontOfSize:13]

@interface SLTripCell ()

@property (nonatomic,weak) UIView *view;
@property (nonatomic,weak) UIImageView *imageV;
@property (nonatomic,weak) UIView *cover;
@property (nonatomic,weak) UILabel *lblText;
@property (nonatomic,weak) UIButton *viewCount;
@property (nonatomic,weak) UIButton *likeCount;
@property (nonatomic,weak) UIButton *commentCount;
@property (nonatomic,weak) UIImageView *userHeadImg;
@property (nonatomic,weak) UILabel *lblUserName;
@property (nonatomic,weak) UILabel *lblStartTime;
@property (nonatomic,weak) UILabel *lblRouteDays;
@property (nonatomic,weak) UILabel *lblTitle;

@end

@implementation SLTripCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"trip";
    id cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 创建cell
//注意：cell是用此方法初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有子控件
        [self setUpAllChildView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUpAllChildView
{
    //imageView
    UIImageView *imageV = [[UIImageView alloc] init];
    [self addSubview:imageV];
    _imageV = imageV;
    
    //遮罩
    UIView *cover = [[UIView alloc] init];
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [imageV addSubview:cover];
    _cover = cover;
    
    //userHeadImg
    UIImageView *userHeadImg = [[UIImageView alloc] init];
    [imageV addSubview:userHeadImg];
    _userHeadImg = userHeadImg;
    
    //userName
    UILabel *lblUserName = [[UILabel alloc] init];
    lblUserName.textColor = [UIColor orangeColor];
    lblUserName.font = SLDetailFont;
    [imageV addSubview:lblUserName];
    _lblUserName = lblUserName;
    
    //startTime
    UILabel *lblStartTime = [[UILabel alloc] init];
    lblStartTime.textColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    lblStartTime.font = SLDetailFont;
    [imageV addSubview:lblStartTime];
    _lblStartTime = lblStartTime;
    
    //routeDays
    UILabel *lblRouteDays = [[UILabel alloc] init];
    lblRouteDays.textColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    lblRouteDays.font = SLDetailFont;
    [imageV addSubview:lblRouteDays];
    _lblRouteDays = lblRouteDays;
    
    //title
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.font = SLTitleFont;
    lblTitle.numberOfLines = 0;
    [imageV addSubview:lblTitle];
    _lblTitle = lblTitle;
    
}

- (void)setTripF:(SLTripFrame *)tripF
{
    _tripF = tripF;
    
    //cover
    self.cover.frame = tripF.coverFrame;
    
    //headImageView
    self.imageV.frame = tripF.headImageFrame;
    NSURL *headImageUrl = [NSURL URLWithString:tripF.trip.headImage];
    [self.imageV sd_setImageWithURL:headImageUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //userHeadImg
    self.userHeadImg.frame = tripF.userHeadImgFrame;
    self.userHeadImg.layer.masksToBounds = YES;
    self.userHeadImg.layer.cornerRadius = self.userHeadImg.bounds.size.width * 0.5;
    self.userHeadImg.layer.borderWidth = 2;
    self.userHeadImg.layer.borderColor = [UIColor whiteColor].CGColor;
    NSURL *userHeadImgUrl = [NSURL URLWithString:tripF.trip.userHeadImg];
    [self.userHeadImg sd_setImageWithURL:userHeadImgUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //userName
    self.lblUserName.frame = tripF.userNameFrame;
    self.lblUserName.text = tripF.trip.userName;
    
    //startTime
    self.lblStartTime.frame = tripF.startTimeFrame;
    self.lblStartTime.text = [NSString stringWithFormat:@"出发：%@ |",tripF.trip.startTime];
    
    //routeDays
    self.lblRouteDays.frame = tripF.routeDaysFrame;
    self.lblRouteDays.text = [NSString stringWithFormat:@"共%@天",tripF.trip.routeDays];
    
    //title
    self.lblTitle.frame = tripF.titleFrame;
    self.lblTitle.text = tripF.trip.title;
  
}


@end










