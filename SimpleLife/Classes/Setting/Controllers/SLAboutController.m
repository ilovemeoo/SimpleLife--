//
//  SLAboutController.m
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLAboutController.h"

@interface SLAboutController ()


@end

@implementation SLAboutController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(7, 27, 35, 35);
    [backBtn setImage:[UIImage imageNamed:@"about_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backBtn];
}

- (void)backToPre
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end






