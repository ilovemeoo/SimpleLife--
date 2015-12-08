//
//  SLTopBar.m
//  SimpleLife
//
//  Created by xhp on 15/11/1.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTopBar.h"

#define marginBtn 30
#define btnTitleFont [UIFont systemFontOfSize:17]

@implementation SLTopBar

@dynamic delegate;

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        //基本属性
        //self.backgroundColor = [UIColor clearColor];
        self.showsHorizontalScrollIndicator = NO;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:CGRectMake(0, 0, self.superview.bounds.size.width, self.superview.bounds.size.height)]; 
}

#pragma mark - 重写set方法，数据接口
-(void)setItemTitles:(NSArray *)itemTitles
{
    _itemTitles = itemTitles;
    
    //根据数据创建子控件
    NSMutableArray *itemBtnArray = [NSMutableArray arrayWithCapacity:itemTitles.count];
    CGFloat x = marginBtn;
    for (NSUInteger i = 0; i < itemTitles.count; i++) {
        //创建内部按钮
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.titleLabel.font = btnTitleFont;
        [itemBtn setTitle:itemTitles[i] forState:UIControlStateNormal];
        
        itemBtn.tag = i;
        [itemBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat width = [self.itemTitles[i] sizeWithFont:btnTitleFont].width;
        itemBtn.frame = CGRectMake(x, 0, width, CGRectGetHeight(self.frame));
        x += width + marginBtn;
        
        [self addSubview:itemBtn];
        [itemBtnArray addObject:itemBtn];
    }
    self.itemBtns = itemBtnArray;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor
{
    //每次选中即可改变
    if (![_itemTitleColor isEqual:itemTitleColor]) {
        _itemTitleColor = itemTitleColor;
        for (UIButton *button in self.itemBtns) {
            [button setTitleColor:itemTitleColor forState:UIControlStateNormal];
        }
    }
}

#pragma mark - life cycle
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置按钮的frame
    CGFloat x = marginBtn;
    for (NSUInteger i = 0; i < self.itemBtns.count; i++) {
        CGFloat width = [self.itemTitles[i] sizeWithFont:btnTitleFont].width;
        UIView *itemView = self.itemBtns[i];
        itemView.frame = CGRectMake(x, 0, width, CGRectGetHeight(self.frame));
        x += width + marginBtn;
    }
    self.contentSize = CGSizeMake(x, 0);
}

#pragma mark - private方法
- (void)btnClick:(UIButton *) sender
{
    if ([self.delegate respondsToSelector:@selector(itemBtnWithIndex:didSelectInTopBar:)]) {
        [self.delegate itemBtnWithIndex:sender.tag didSelectInTopBar:self];
    }
//    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
//        [self.delegate scrollViewDidScroll:self];
//    }
}

#pragma mark - public方法
- (CGPoint)contentOffsetForSelectedItemAtIndex:(NSUInteger)index
{
    if (self.itemBtns.count < index || self.itemBtns.count == 1) {
        return CGPointZero;
    } else {
        CGFloat totalOffset = self.contentSize.width - CGRectGetWidth(self.frame);
        return CGPointMake(index * totalOffset / (self.itemBtns.count - 1), 0);
    }
}

@end










