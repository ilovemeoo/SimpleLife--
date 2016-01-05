//
//  SLBtnView.m
//  SimpleLife
//
//  Created by xhp on 15/11/6.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLBtnView.h"

#define marginXY 10

@implementation SLBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        //设置内部属性
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = marginXY;
    CGFloat imageH = self.bounds.size.height * 0.6;
    CGFloat imageW = self.bounds.size.width;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);

    // 2.title
    CGFloat titleX = 0;
    CGFloat titleY = imageH;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = 30;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //设置显示
    self.imageView.hidden = NO;
    self.titleLabel.hidden = NO;
    self.userInteractionEnabled = YES;
}

@end









