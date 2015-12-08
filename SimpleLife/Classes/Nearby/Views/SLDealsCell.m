//
//  SLDealsCell.m
//  SimpleLife
//
//  Created by xhp on 15/11/9.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLDealsCell.h"
#import "UIImageView+WebCache.h"

@interface SLDealsCell ()

@property (nonatomic,weak) UIView *view;
@property (nonatomic,weak) UILabel *lblTitle;
@property (nonatomic,weak) UILabel *lblComment;
@property (nonatomic,weak) UILabel *lblScore;
@property (nonatomic,weak) UIView *seperator;
@property (nonatomic,weak) UIImageView *imageV;
@property (nonatomic,weak) UILabel *lblDescription;
@property (nonatomic,weak) UILabel *lblCurrentPrice;
@property (nonatomic,weak) UILabel *lblMarketPrice;
@property (nonatomic,weak) UILabel *lblSale_num;
@property (nonatomic,weak) UIImageView *imageReservation;

@end

@implementation SLDealsCell

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"deals";
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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setUpAllChildView
{
    //veiw
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    _view = view;
    
    //title
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor colorWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:1.0];
    lblTitle.font = [UIFont systemFontOfSize:16];
    [_view addSubview:lblTitle];
    _lblTitle = lblTitle;
    
    //comment
    UILabel *lblComment = [[UILabel alloc] init];
    lblComment.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0];
    lblComment.font = [UIFont systemFontOfSize:12];
    [_view addSubview:lblComment];
    _lblComment = lblComment;
    
    //score
    UILabel *lblScore = [[UILabel alloc] init];
    lblScore.textColor = [UIColor orangeColor];
    lblScore.font = [UIFont systemFontOfSize:12];
    [_view addSubview:lblScore];
    _lblScore = lblScore;
    
    //seperator
    UIView *seperator = [[UIView alloc] init];
    seperator.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_view addSubview:seperator];
    _seperator = seperator;
    
    //imageview
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [_view addSubview:imageV];
    _imageV = imageV;
    
    //reservation
    UIImageView *imageReservation = [[UIImageView alloc] init];
    imageReservation.contentMode = UIViewContentModeScaleAspectFit;
    [_view addSubview:imageReservation];
    _imageReservation = imageReservation;
    
    //Description
    UILabel *lblDescription = [[UILabel alloc] init];
    lblDescription.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
    lblDescription.numberOfLines = 0;
    lblDescription.font = [UIFont systemFontOfSize:13];
    [_view addSubview:lblDescription];
    _lblDescription = lblDescription;
    
    //currentPrice
    UILabel *lblCurrentPrice = [[UILabel alloc] init];
    lblCurrentPrice.textColor = [UIColor colorWithRed:226/255.0 green:45/255.0 blue:112/255.0 alpha:1.0];
    lblCurrentPrice.font = [UIFont systemFontOfSize:13];
    [_view addSubview:lblCurrentPrice];
    _lblCurrentPrice = lblCurrentPrice;
    
    //marketPrice
    UILabel *lblMarketPrice = [[UILabel alloc] init];
    lblMarketPrice.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0];
    lblMarketPrice.font = [UIFont systemFontOfSize:12];
    [_view addSubview:lblMarketPrice];
    _lblMarketPrice = lblMarketPrice;
    
    //sale_num
    UILabel *lblSale_num = [[UILabel alloc] init];
    lblSale_num.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0];
    lblSale_num.font = [UIFont systemFontOfSize:12];
    lblSale_num.textAlignment = NSTextAlignmentRight;
    [_view addSubview:lblSale_num];
    _lblSale_num = lblSale_num;
    
}

#pragma mark - 设置数据
-(void)setDealF:(SLDealsFrame *)dealF
{
    _dealF = dealF;
    
    //veiw
    self.view.frame = dealF.viewFrame;
    
    //title
    self.lblTitle.frame = dealF.titleFrame;
    self.lblTitle.text = dealF.deal.title;
    
    //comment
    self.lblComment.frame = dealF.comment_numFrame;
    self.lblComment.text = [NSString stringWithFormat:@"%@人评价",[dealF.deal.comment_num stringValue]];
    
    //score
    self.lblScore.frame = dealF.scoreFrame;
    if (dealF.deal.score.length) {
        self.lblScore.text = [NSString stringWithFormat:@"%@分",dealF.deal.score];
    }else{
        self.lblScore.text = @"暂无评分";
    }
    
    //seperator
    self.seperator.frame = dealF.seperatorFrame;
    
    //imageview
    self.imageV.frame = dealF.tiny_imageFrame;
    NSURL *imageUrl = [NSURL URLWithString:dealF.deal.tiny_image];
    [self.imageV sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //reservation
    self.imageReservation.frame = dealF.reservationFrame;
    self.imageReservation.image = [UIImage imageNamed:@"free-appointment"];
    
    //Description
    self.lblDescription.frame = dealF.descriptionFrame;
    self.lblDescription.text = dealF.deal.description;
    
    //currentPrice
    self.lblCurrentPrice.frame = dealF.current_priceFrame;
    int currentPrice = [dealF.deal.current_price intValue] / 100;
    self.lblCurrentPrice.text = [NSString stringWithFormat:@"￥%d",currentPrice];
    
    //marketPrice
    self.lblMarketPrice.frame = dealF.market_priceFrame;
    int marketPrice = [dealF.deal.market_price intValue] / 100;
    NSMutableAttributedString *marketStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d",marketPrice]];
    NSRange strRange = {0,[marketStr length]};
    [marketStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    self.lblMarketPrice.attributedText = marketStr;
    
    //sale_num
    self.lblSale_num.frame = dealF.sale_numFrame;
    if ([dealF.deal.sale_num stringValue].length > 0) {
        if ([dealF.deal.sale_num intValue] >= 10000) {
            int saleNum = [dealF.deal.sale_num intValue] /10000;
            self.lblSale_num.text = [NSString stringWithFormat:@"已售%d万",saleNum];
        }else{
            self.lblSale_num.text = [NSString stringWithFormat:@"已售%@",[dealF.deal.sale_num stringValue]];
        }
    }else{
        self.lblSale_num.text = @"售出0";
    }
    
}

@end





















