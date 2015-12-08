//
//  SLTripFrame.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripFrame.h"

#define SLCellEginset 10
#define SLTitleFont [UIFont boldSystemFontOfSize:18]
#define SLDetailFont [UIFont systemFontOfSize:13]
#define screenWidth [UIScreen mainScreen].bounds.size.width

@implementation SLTripFrame

#pragma mark - trip的set方法
- (void)setTrip:(SLTrip *)trip
{
    _trip = trip;
    
    //计算view的frame
    [self setUpViewFrame];
    
    //计算cell高度
    _cellHeight = CGRectGetMaxY(_headImageFrame);
    
}

- (void)setUpViewFrame
{
    //headImageFrame
    CGFloat headImageX = SLCellEginset;
    CGFloat headImageY = headImageX;
    CGFloat headImageW = screenWidth - SLCellEginset * 2;
    CGFloat headImageH = headImageW / 1.5;
    _headImageFrame = CGRectMake(headImageX, headImageY, headImageW, headImageH);
    
    //userHeadImgFrame
    CGFloat userHeadWH = 40;
    CGFloat userHeadX = SLCellEginset * 1.5;
    CGFloat userHeadY = headImageH - userHeadWH - SLCellEginset;
    _userHeadImgFrame = CGRectMake(userHeadX, userHeadY, userHeadWH, userHeadWH);
    
    //userNameFrame
    CGFloat userNameX = CGRectGetMaxX(_userHeadImgFrame) + SLCellEginset;
    CGSize userNameSize = [_trip.userName sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
    CGFloat userNameY = CGRectGetMaxY(_userHeadImgFrame) - userNameSize.height;
    _userNameFrame = (CGRect){{userNameX,userNameY},userNameSize};
    
    //startTimeFrame
    CGFloat startTimeX = CGRectGetMaxX(_userNameFrame) + SLCellEginset;
    CGSize startTimeSize = [[NSString stringWithFormat:@"出发：%@ |",_trip.startTime] sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
    CGFloat startTimeY = userNameY;
    _startTimeFrame = (CGRect){{startTimeX,startTimeY},startTimeSize};
    
    //routeDaysFrame
    CGFloat routeDaysX = CGRectGetMaxX(_startTimeFrame) + SLCellEginset * 0.4;
    CGSize routeDaysSize = [[NSString stringWithFormat:@"共%@天",_trip.routeDays] sizeWithAttributes:@{NSFontAttributeName:SLDetailFont}];
    CGFloat routeDaysY = userNameY;
    _routeDaysFrame = (CGRect){{routeDaysX,routeDaysY},routeDaysSize};
    
    //titleFrame
    CGFloat titleX = userNameX;
    CGFloat titleW = headImageW - titleX;
    CGSize titleSize = [_trip.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:SLTitleFont} context:nil].size;
    CGFloat titleY = userNameY - titleSize.height - SLCellEginset * 0.5;
    _titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    //coverFrame
    CGFloat coverX = 0;
    CGFloat coverY = titleY - SLCellEginset * 0.5;
    CGFloat coverW = headImageW;
    CGFloat coverH = headImageH - coverY;
    _coverFrame = CGRectMake(coverX, coverY, coverW, coverH);
}

@end


















