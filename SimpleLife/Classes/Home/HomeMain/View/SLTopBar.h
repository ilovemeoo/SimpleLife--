//
//  SLTopBar.h
//  SimpleLife
//
//  Created by xhp on 15/11/1.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLTopBar;
@protocol SLTopBarDelegate<UIScrollViewDelegate>

@optional
- (void)itemBtnWithIndex:(NSUInteger)index didSelectInTopBar:(SLTopBar *) topBar;

@end

@interface SLTopBar : UIScrollView

/**
 *  标题
 */
@property (strong, nonatomic) NSArray *itemTitles;
/**
 *  存储topBar中的按钮
 */
@property (nonatomic,strong) NSArray *itemBtns;
/**
 *  文字颜色
 */
@property (strong, nonatomic) UIColor *itemTitleColor;

@property (nonatomic,weak) id<SLTopBarDelegate> delegate;

/**
 *  设置topBar中按钮位置
 */
- (CGPoint)contentOffsetForSelectedItemAtIndex:(NSUInteger)index;

@end








