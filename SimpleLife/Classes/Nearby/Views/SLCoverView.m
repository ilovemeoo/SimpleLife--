//
//  SLCoverView.m
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLCoverView.h"

#define coverAlpha 0.5

@implementation SLCoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.alpha = coverAlpha;
    }
    return self;
}

- (void)reset
{
    self.alpha = coverAlpha;
}

+ (id)cover
{
    return [[self alloc] init];
}

+ (id)coverWithTarget:(id)target action:(SEL)action
{
    SLCoverView *cover = [self cover];
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    return cover;
}

@end





