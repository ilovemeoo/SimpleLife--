//
//  SLDomesticNewsFrame.m
//  SimpleLife
//
//  Created by xhp on 16/1/2.
//  Copyright © 2016年 xhp. All rights reserved.
//

#import "SLFinantialNewsFrame.h"

#define SLCellEginset 10
#define SLTitleFont [UIFont systemFontOfSize:18]
#define SLDetailFont [UIFont systemFontOfSize:12]
#define screenWidth [UIScreen mainScreen].bounds.size.width

@implementation SLFinantialNewsFrame

#pragma mark - trip的set方法
- (void)setHotNews:(SLHotNews *)hotNews
{
    _hotNews = hotNews;
    
    //计算view的frame
    [self setUpViewFrame];
    
    //计算cell高度
    _cellHeight = CGRectGetMaxY(_viewFrame);
    
}

- (void)setUpViewFrame
{
    if (_hotNews.imageurls.count == 0) {
        
        //titleFrame
        CGFloat titleX = SLCellEginset;
        CGFloat titleY = titleX;
        CGFloat titleW = screenWidth - titleX * 2;
        CGSize titleSize = [_hotNews.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLTitleFont} context:nil].size;
        _titleFrame = (CGRect){{titleX,titleY},titleSize};
        
        //sourceFrame
        CGFloat sourceX = titleX;
        CGFloat sourceY = CGRectGetMaxY(_titleFrame) + SLCellEginset;
        CGSize sourceSize = [_hotNews.source sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
        
        //pubDateFrame
        CGFloat pubDateX =  CGRectGetMaxX(_sourceFrame) + SLCellEginset;;
        CGFloat pubDateY = sourceY;
        CGSize pubDateSize = [_hotNews.pubDate sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _pubDateFrame = (CGRect){{pubDateX,pubDateY},pubDateSize};
        
        //viewframe
        CGFloat viewX = SLCellEginset * 0.8;
        CGFloat viewY = CGRectGetMaxY(_sourceFrame) + SLCellEginset;
        CGFloat viewW = [UIScreen mainScreen].bounds.size.width - SLCellEginset * 1.6;
        CGFloat viewH = 0.5;
        _viewFrame = CGRectMake(viewX, viewY, viewW, viewH);
        
    }else if (_hotNews.imageurls.count == 1) {
        
        CGFloat imageW = 90;
        CGFloat imageH = 65;
        //titleFrame
        CGFloat titleX = SLCellEginset;
        CGFloat titleY = titleX;
        CGFloat titleW = screenWidth - titleX * 3 - imageW;
        CGSize titleSize = [_hotNews.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLTitleFont} context:nil].size;
        _titleFrame = (CGRect){{titleX,titleY},titleSize};
        
        //imageFrame
        CGFloat imageX = screenWidth - SLCellEginset - imageW;
        CGFloat imageY= titleY;
        _imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
        
        //sourceFrame
        CGFloat sourceX = titleX;
        CGFloat sourceY = CGRectGetMaxY(_titleFrame) + SLCellEginset;
        CGSize sourceSize = [_hotNews.source sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
        
        //pubDateFrame
        CGFloat pubDateX =  CGRectGetMaxX(_sourceFrame) + SLCellEginset;
        CGFloat pubDateY = sourceY;
        CGSize pubDateSize = [_hotNews.pubDate sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _pubDateFrame = (CGRect){{pubDateX,pubDateY},pubDateSize};
        
        //viewframe
        CGFloat viewX = SLCellEginset * 0.8;
        CGFloat viewY = MAX(CGRectGetMaxY(_sourceFrame),CGRectGetMaxY(_imageFrame)) + SLCellEginset;
        CGFloat viewW = [UIScreen mainScreen].bounds.size.width - SLCellEginset * 1.6;
        CGFloat viewH = 0.5;
        _viewFrame = CGRectMake(viewX, viewY, viewW, viewH);
        
    }else{
        
        //titleFrame
        CGFloat titleX = SLCellEginset;
        CGFloat titleY = titleX;
        CGFloat titleW = screenWidth - titleX * 2;
        CGSize titleSize = [_hotNews.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLTitleFont} context:nil].size;
        _titleFrame = (CGRect){{titleX,titleY},titleSize};
        
        //imageFrame
        CGFloat imageX = titleX;
        CGFloat imageY= CGRectGetMaxY(_titleFrame) + SLCellEginset;
        CGFloat imageW = screenWidth - SLCellEginset * 2;
        CGFloat imageH = 80;
        _imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
        
        //sourceFrame
        CGFloat sourceX = titleX;
        CGFloat sourceY = CGRectGetMaxY(_imageFrame) + SLCellEginset;
        CGSize sourceSize = [_hotNews.source sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
        
        //pubDateFrame
        CGFloat pubDateX =  CGRectGetMaxX(_sourceFrame) + SLCellEginset;;
        CGFloat pubDateY = sourceY;
        CGSize pubDateSize = [_hotNews.pubDate sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
        _pubDateFrame = (CGRect){{pubDateX,pubDateY},pubDateSize};
        
        //viewframe
        CGFloat viewX = SLCellEginset * 0.8;
        CGFloat viewY = CGRectGetMaxY(_sourceFrame) + SLCellEginset;
        CGFloat viewW = [UIScreen mainScreen].bounds.size.width - SLCellEginset * 1.6;
        CGFloat viewH = 0.5;
        _viewFrame = CGRectMake(viewX, viewY, viewW, viewH);
        
    }
}


@end
