//
//  SLNewsController.m
//  SimpleLife
//
//  Created by xhp on 15/11/6.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLNewsController.h"
#import "SLNewsUrl.h"
#import "SLBtnView.h"
#import "SLUrlController.h"
#import "SLTempNavigationController.h"

@interface SLNewsController ()

@property (nonatomic,strong) NSArray *newsArray;

@end

@implementation SLNewsController

#pragma mark - 懒加载
- (NSArray *)newsArray
{
    if (_newsArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"newsUrl.plist" ofType:nil];
        NSArray *Array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in Array) {
            SLNewsUrl *news = [SLNewsUrl newsWithDictionary:dict];
            [arrayM addObject:news];
        }
        _newsArray = arrayM;
    }
    return _newsArray;
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    //设置基本属性
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    //添加子控件
    [self addAllChildViews];
}

- (void)addAllChildViews
{
    //创建按钮
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height - 44)];
    
    NSUInteger cols = 3;
    NSUInteger rows = self.newsArray.count / cols;
    CGFloat btnW = (self.view.bounds.size.width - (cols - 1)) / cols;
    CGFloat btnH = btnW;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i < self.newsArray.count; i++) {
        btnX = i % cols * (btnW + 1);
        btnY = i / rows * (btnH + 10);
        
        SLBtnView *btn = [SLBtnView buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        SLNewsUrl *news = self.newsArray[i];
        btn.imageView.image = [UIImage imageNamed:news.icon];
        btn.titleLabel.text = news.name;
        btn.titleLabel.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnView addSubview:btn];
    }
    
    [self.view addSubview:btnView];
}

- (void)btnClick:(UIButton *)sender
{
    SLUrlController *urlVC = [[SLUrlController alloc] init];
    SLNewsUrl *news = self.newsArray[sender.tag];
    urlVC.url = news.url;
    
    SLTempNavigationController *temNav = [[SLTempNavigationController alloc] initWithRootViewController:urlVC];
    [self.view.window.rootViewController presentViewController:temNav animated:YES completion:nil];
}

@end








