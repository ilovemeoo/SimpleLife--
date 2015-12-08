//
//  SLTabBarController.m
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTabBarController.h"
#import "SLNavigationController.h"
#import "SLMainController.h"
#import "SLNearbyController.h"
#import "SLSearchMoreController.h"
#import "SLSettingController.h"

#import "SLTabBar.h"

@interface SLTabBarController ()<SLTabBarDelegate>

@property (nonatomic,weak) SLMainController *home;
@property (nonatomic,weak) SLNearbyController *nearby;
@property (nonatomic,weak) SLSearchMoreController *search;
@property (nonatomic,weak) SLSettingController *setting;
/**
 *  存储tabBar中的item属性
 */
@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation SLTabBarController

#pragma mark - 属性懒加载
- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - 加载
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建子控制器
    [self setUpAllChildViewController];
    
    //设置tabBar
    [self setUpTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //移除tabBar中的系统按钮
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UIControl")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

#pragma mark - 添加所有子控件
- (void)setUpAllChildViewController
{
    //首页
    SLMainController *home = [[SLMainController alloc] init];
    [self setUpOneChildViewController:home image:@"Home_normal" seletedImage:@"Home_hightlighted" tittle:@"首页"];
    _home = home;
    
    //附近团购
    SLNearbyController *nearby = [[SLNearbyController alloc] init];
    [self setUpOneChildViewController:nearby image:@"Nearby_normal" seletedImage:@"Nearby_hightlighted" tittle:@"附近"];
    _nearby = nearby;
    
    //常用查询
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SLSearchMore" bundle:nil];
    SLSearchMoreController *search = [storyboard instantiateViewControllerWithIdentifier:@"SearchMore"];
    [self setUpOneChildViewController:search image:@"Search_normal" seletedImage:@"Search_hightlighted" tittle:@"查询"];
    _search = search;
    
    //设置
    SLSettingController *setting = [[SLSettingController alloc] init];
    [self setUpOneChildViewController:setting image:@"Settings_normal" seletedImage:@"Settings_hightlighted" tittle:@"设置"];
    _setting = setting;
    
}

- (void)setUpOneChildViewController:(UIViewController *) vc image:(NSString *) image seletedImage:(NSString *) selectedImage tittle:(NSString *) name
{
    vc.title = name;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self.items addObject:vc.tabBarItem];
    
    SLNavigationController *nc = [[SLNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nc];
}

#pragma mark - 设置tabBar
- (void)setUpTabBar
{
    SLTabBar *tabBar = [[SLTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    //设置代理
    tabBar.delegate = self;
    //将items传入
    tabBar.items = self.items;
    [self.tabBar addSubview:tabBar];
}

#pragma mark - tabBar代理方法实现
- (void)tabBar:(SLTabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
}

@end









