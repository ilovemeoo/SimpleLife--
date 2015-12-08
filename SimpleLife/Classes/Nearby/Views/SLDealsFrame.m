//
//  SLDealsFrame.m
//  SimpleLife
//
//  Created by xhp on 15/11/9.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLDealsFrame.h"

#define SLCellEginset 10
#define SLDescriptionFont [UIFont systemFontOfSize:13]
#define SLTitleFont [UIFont systemFontOfSize:16]
#define SLDetailFont [UIFont systemFontOfSize:12]
#define screenWidth [UIScreen mainScreen].bounds.size.width

@implementation SLDealsFrame

#pragma mark - deal的set方法
- (void)setDeal:(SLDeal *)deal
{
    _deal = deal;
    
    //计算view的frame
    [self setUpViewFrame];
    
    //计算cell高度
    _cellHeight = CGRectGetMaxY(_viewFrame) + SLCellEginset;
    
}

- (void)setUpViewFrame
{
    //titleFrame
    CGFloat titleX = SLCellEginset;
    CGFloat titleY = titleX * 0.8;
    NSMutableDictionary *attrTitle= [NSMutableDictionary dictionary];
    attrTitle[NSFontAttributeName] = SLTitleFont;
    CGSize titleSize = [_deal.title sizeWithAttributes:attrTitle];
    _titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    //comment_numFrame
    if (_deal.comment_num) {
        CGFloat commentX = CGRectGetMaxX(_titleFrame) + SLCellEginset;
        NSMutableDictionary *attrComment= [NSMutableDictionary dictionary];
        attrComment[NSFontAttributeName] = SLDetailFont;
        NSString *comment = [NSString stringWithFormat:@"%@人评价",[_deal.comment_num stringValue]];
        CGSize commentSize = [comment sizeWithAttributes:attrComment];
        CGFloat commentY = CGRectGetMaxY(_titleFrame) - commentSize.height;
        _comment_numFrame = (CGRect){{commentX,commentY},commentSize};
    }

    //scoreFrame
    NSMutableDictionary *attrScore= [NSMutableDictionary dictionary];
    attrScore[NSFontAttributeName] = SLDetailFont;
    NSString *score = nil;
    if (_deal.score.length) {
        score = [NSString stringWithFormat:@"%@分",_deal.score];
    }else{
        score = @"暂无评分";
    }
    CGSize scoreSize = [score sizeWithAttributes:attrScore];
    CGFloat scoreX = screenWidth - SLCellEginset - scoreSize.width;
    CGFloat scoreY = titleY;
    _scoreFrame = (CGRect){{scoreX,scoreY},scoreSize};
    
    //seperatorFrame分割线
    CGFloat seperatorX = SLCellEginset * 0.5;
    CGFloat seperatorY = CGRectGetMaxY(_titleFrame) + SLCellEginset * 0.8;
    CGFloat seperatorW = screenWidth - SLCellEginset;
    CGFloat seperatorH = 0.5;
    _seperatorFrame = CGRectMake(seperatorX, seperatorY, seperatorW, seperatorH);
    
    //tiny_imageFrame
    CGFloat imageX = SLCellEginset;
    CGFloat imageY = CGRectGetMaxY(_seperatorFrame) + SLCellEginset;
    CGFloat imageW = 95;
    CGFloat imageH = 60;
    _tiny_imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //预约图片Frame
    if (!_deal.is_reservation_required) { 
        CGFloat reservationX = imageX;
        CGFloat reservationY = imageY;
        CGFloat reservationW = 40;
        CGFloat reservationH = 40;
        _reservationFrame = CGRectMake(reservationX, reservationY, reservationW, reservationH);
    }

    //descriptionFrame
    CGFloat descriptionX = CGRectGetMaxX(_tiny_imageFrame) + SLCellEginset;
    CGFloat descriptionY = imageY;
    CGFloat descriptionW = screenWidth - SLCellEginset * 0.5 - descriptionX;
    CGSize descriptionSize = [_deal.description boundingRectWithSize:CGSizeMake(descriptionW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLDescriptionFont} context:nil].size;
    _descriptionFrame = (CGRect){{descriptionX,descriptionY},descriptionSize};
    
    //current_priceFrame
    CGFloat current_priceX = descriptionX;
    NSMutableDictionary *attrCurrent_price= [NSMutableDictionary dictionary];
    attrCurrent_price[NSFontAttributeName] = SLDescriptionFont;
    int currentPrice = [_deal.current_price intValue] / 100;
    CGSize current_priceSize = [[NSString stringWithFormat:@"￥%d",currentPrice] sizeWithAttributes:attrCurrent_price];
    CGFloat current_priceY = MAX(CGRectGetMaxY(_tiny_imageFrame) - current_priceSize.height, CGRectGetMaxY(_descriptionFrame));
    _current_priceFrame = (CGRect){{current_priceX,current_priceY},current_priceSize};
    
    //market_priceFrame
    CGFloat market_priceX = CGRectGetMaxX(_current_priceFrame) + SLCellEginset;
    NSMutableDictionary *attrMarket_price= [NSMutableDictionary dictionary];
    attrMarket_price[NSFontAttributeName] = SLDetailFont;
    int marketPrice = [_deal.market_price intValue] / 100;
    CGSize market_priceSize = [[NSString stringWithFormat:@"%d",marketPrice] sizeWithAttributes:attrMarket_price];
    CGFloat market_priceY = CGRectGetMaxY(_current_priceFrame) - market_priceSize.height;
    _market_priceFrame = (CGRect){{market_priceX,market_priceY},market_priceSize};
    
    //sale_numFrame
    NSMutableDictionary *attrSale_num= [NSMutableDictionary dictionary];
    attrSale_num[NSFontAttributeName] = SLDetailFont;
    
    CGSize sale_numSize;
    if ([_deal.sale_num stringValue].length > 0) {
        if ([_deal.sale_num intValue] >= 10000) {
            int saleNum = [_deal.sale_num intValue] /10000;
            sale_numSize = [[NSString stringWithFormat:@"已售%d万",saleNum] sizeWithAttributes:attrSale_num];
        }else{
            sale_numSize = [[NSString stringWithFormat:@"已售%d",[_deal.sale_num intValue]] sizeWithAttributes:attrSale_num];
        }
    }else{
        sale_numSize = [@"售出0" sizeWithAttributes:attrSale_num];
    }
    
    CGFloat sale_numX = screenWidth - SLCellEginset - sale_numSize.width;
    CGFloat sale_numY = market_priceY;
    _sale_numFrame = (CGRect){{sale_numX,sale_numY},sale_numSize};
    
    //viewFrame
    CGFloat viewH = CGRectGetMaxY(_current_priceFrame) + SLCellEginset * 0.8;
    _viewFrame = CGRectMake(0, 0, screenWidth, viewH);
    
}

@end











