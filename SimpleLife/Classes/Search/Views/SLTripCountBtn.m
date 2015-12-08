//
//  SLTripCountBtn.m
//  SimpleLife
//
//  Created by xhp on 15/11/13.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTripCountBtn.h"

@implementation SLTripCountBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        //设置内部属性
        self.imageView.contentMode = UIViewContentModeRight;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageH = self.bounds.size.height;
    CGFloat imageW = self.bounds.size.width * 0.5;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 2.title
    CGFloat titleX = self.bounds.size.width * 0.5;
    CGFloat titleY = 0;
    CGFloat titleW = imageW;
    CGFloat titleH = imageH;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //设置显示
    self.imageView.hidden = NO;
    self.titleLabel.hidden = NO;
}

@end
