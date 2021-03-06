//
//  SLDomesticNewsCell.m
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import "SLFinantialNewsCell.h"
#import "SLImages.h"

#define SLTitleFont [UIFont systemFontOfSize:18]
#define SLDetailFont [UIFont systemFontOfSize:12]

@interface SLFinantialNewsCell ()

@property (nonatomic,weak) UILabel *lblTitle;
@property (nonatomic,weak) UILabel *lblSource;
@property (nonatomic,weak) UILabel *lblPubDate;
@property (nonatomic,weak) SLImages *imageV;
@property (nonatomic,weak) UIView *seperator;

@end

@implementation SLFinantialNewsCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"FinantialNews";
    id cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 创建cell
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
    //title
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
    lblTitle.font = SLTitleFont;
    lblTitle.numberOfLines = 0;
    [self addSubview:lblTitle];
    _lblTitle = lblTitle;
    
    //imageView
    SLImages *imageV = [[SLImages alloc] init];
    [self addSubview:imageV];
    _imageV = imageV;
    
    //lblSource
    UILabel *lblSource = [[UILabel alloc] init];
    lblSource.textColor = [UIColor colorWithRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:1.0];
    lblSource.font = SLDetailFont;
    [self addSubview:lblSource];
    _lblSource = lblSource;
    
    //lblPubDate
    UILabel *lblPubDate = [[UILabel alloc] init];
    lblPubDate.textColor = [UIColor colorWithRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:1.0];
    lblPubDate.font = SLDetailFont;
    [self addSubview:lblPubDate];
    _lblPubDate = lblPubDate;
    
    UIView *seperator = [[UIView alloc] init];
    seperator.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [self addSubview:seperator];
    _seperator = seperator;
    
}

- (void)setFinantialNewsF:(SLFinantialNewsFrame *)finantialNewsF
{
    _finantialNewsF = finantialNewsF;
    
    //title
    self.lblTitle.frame = finantialNewsF.titleFrame;
    self.lblTitle.text = finantialNewsF.hotNews.title;
    
    //source
    self.lblSource.frame = finantialNewsF.sourceFrame;
    self.lblSource.text = finantialNewsF.hotNews.source;
    
    //pubDate
    self.lblPubDate.frame = finantialNewsF.pubDateFrame;
    self.lblPubDate.text = finantialNewsF.hotNews.pubDate;
    
    self.imageV.frame = finantialNewsF.imageFrame;
    self.imageV.image_urls = finantialNewsF.hotNews.imageurls;
    
    self.seperator.frame = finantialNewsF.viewFrame;
}

@end
