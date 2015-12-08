//
//  SLJokesFrame.m
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLJokesFrame.h"

#define SLCellEginset 10
#define SLTimeFont [UIFont systemFontOfSize:13]
#define SLContentFont [UIFont systemFontOfSize:15]

@implementation SLJokesFrame

#pragma mark - joke的set方法
- (void)setJoke:(SLJoke *)joke
{
    _joke = joke;
    
    //计算view的frame
    [self setUpViewFrame];
    
    //计算cell高度
    _cellHeight = CGRectGetMaxY(_viewFrame) ;
}

- (void)setUpViewFrame
{
    //计算time的frame
    CGFloat timeX = SLCellEginset;
    CGFloat timeY = timeX;
    NSMutableDictionary *attrTime= [NSMutableDictionary dictionary];
    attrTime[NSFontAttributeName] =SLTimeFont;
    CGSize timeSize = [_joke.updatetime sizeWithAttributes:attrTime];
    _updateTimeFrame = (CGRect){{timeX,timeY},timeSize};
    
    //计算正文frame
    CGFloat contentX = SLCellEginset;
    CGFloat contentY = CGRectGetMaxY(_updateTimeFrame) + SLCellEginset * 0.8;
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - SLCellEginset * 4;
    
    CGSize contentSize = [_joke.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLContentFont} context:nil].size;
    //CGSize contentSize = [_joke.content sizeWithFont:SLContentFont constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    _contentFrame = (CGRect){{contentX,contentY},contentSize};
    
    //计算图片frame
    CGFloat imageX = SLCellEginset;
    CGFloat imageY = CGRectGetMaxY(_contentFrame) + SLCellEginset * 0.8;
    CGFloat imageWH = 150;
    _imageFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //viewframe
    CGFloat viewX = SLCellEginset * 0.8;
    CGFloat viewY = viewX;
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width - SLCellEginset * 1.6;
    CGFloat viewH = CGRectGetMaxY(_imageFrame) + SLCellEginset;
    _viewFrame = CGRectMake(viewX, viewY, viewW, viewH);
    
}

@end









