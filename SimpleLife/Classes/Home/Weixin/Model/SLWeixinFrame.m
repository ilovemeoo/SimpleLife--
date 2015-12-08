//
//  SLWeixinFrame.m
//  SimpleLife
//
//  Created by xhp on 15/10/31.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLWeixinFrame.h"

#define SLCellEginset 10
#define SLSourceFont [UIFont systemFontOfSize:13]
#define SLTitleFont [UIFont systemFontOfSize:16]

@implementation SLWeixinFrame

#pragma mark - joke的set方法
- (void)setWeixin:(SLWeixin *)weixin
{
    _weixin = weixin;
    
    //计算view的frame
    [self setUpViewFrame];
    
    //计算cell高度
    _cellHeight = MAX(CGRectGetMaxY(_firstImgFrame), CGRectGetMaxY(_titleFrame)) + SLCellEginset;
    
}

- (void)setUpViewFrame
{
    //计算firstImg的frame
    CGFloat imageX = SLCellEginset;
    CGFloat imageY = imageX;
    CGFloat imageWH = 60;
    _firstImgFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //计算source的frame
    CGFloat sourceX = CGRectGetMaxX(_firstImgFrame) + SLCellEginset * 0.8;
    CGFloat sourceY = SLCellEginset;
    NSMutableDictionary *attrSource= [NSMutableDictionary dictionary];
    attrSource[NSFontAttributeName] =SLSourceFont;
    CGSize sourceSize = [_weixin.source sizeWithAttributes:attrSource];
    _sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
    
    //title的frame
    CGFloat titleX = sourceX;
    CGFloat titleY = CGRectGetMaxY(_sourceFrame) + SLCellEginset * 0.8;
    CGFloat titleW = [UIScreen mainScreen].bounds.size.width - sourceX -SLCellEginset * 0.5;
    CGSize titleSize = [_weixin.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLTitleFont} context:nil].size;
    //CGSize titleSize = [_weixin.title sizeWithFont:SLTitleFont constrainedToSize:CGSizeMake(titleW, MAXFLOAT)];
    _titleFrame = (CGRect){{titleX,titleY},titleSize};
}

@end






