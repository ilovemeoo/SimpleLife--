//
//  AppDelegate.m
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "AppDelegate.h"
#import "SLTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.创建控制器
    SLTabBarController *tabBarVC = [[SLTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end








