//
//  SLScrollView.m
//  SimpleLife
//
//  Created by xhp on 15/10/27.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLScrollView.h"

@implementation SLScrollView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {  
        //基本属性
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
    }
    return self;
}

#pragma mark - life cycle
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 0;
    for (UIViewController *viewController in self.viewControllers) {
        viewController.view.frame = CGRectMake(x, 0, self.bounds.size.width, self.bounds.size.height);
        [self addSubview:viewController.view];
        x += self.bounds.size.width;
    }
    self.contentSize = CGSizeMake(x, 0);
}

@end










