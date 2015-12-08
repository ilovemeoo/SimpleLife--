//
//  SLTabBar.m
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTabBar.h"
#import "SLTabBarButton.h"

@interface SLTabBar ()

/**
 *  按钮存储数组
 */
@property (nonatomic,strong) NSMutableArray *itemButtons;
/**
 *  记录选中按钮
 */
@property (nonatomic,weak) UIButton *selectedButton;

@end

@implementation SLTabBar

#pragma mark - 属性懒加载
- (NSMutableArray *)itemButtons
{
    if (_itemButtons == nil) {
        _itemButtons = [NSMutableArray array];
    }
    return _itemButtons;
}

#pragma mark - 重写items的set方法
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in _items) {
        SLTabBarButton *btn = [SLTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.itemButtons.count;
        //设置按钮点击事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        //默认初始化第一个
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [self.itemButtons addObject:btn];
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *) button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

#pragma mark - 初始化子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //将所有按钮添加
    CGFloat itemX = 0;
    CGFloat itemY = 0;
    CGFloat itemW = self.frame.size.width / self.items.count;
    CGFloat itemH = self.frame.size.height;
    
    int i = 0;
    for (UIView *tabBarButton in self.itemButtons) {
        itemX = itemW * i;
        tabBarButton.frame = CGRectMake(itemX, itemY, itemW, itemH);
        i++;
    }
    
}

@end









