//
//  SLTabBar.h
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLTabBar;
//代理属性
@protocol SLTabBarDelegate <NSObject>

@optional
/**
 *  代理方法
 */
- (void)tabBar:(SLTabBar *)tabBar didClickButton:(NSInteger)index;

@end

@interface SLTabBar : UIView

/**
 *  tabBar中的itemButton
 */
@property (nonatomic,strong) NSArray *items;
/**
 *  代理属性
 */
@property (nonatomic,weak) id<SLTabBarDelegate> delegate;

@end
