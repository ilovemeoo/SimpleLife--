//
//  SLNavigationController.m
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNavigationController.h"

@interface SLNavigationController ()<UINavigationControllerDelegate>

@end

@implementation SLNavigationController

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
}

@end


















