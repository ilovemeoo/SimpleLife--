//
//  SLWeatherController.m
//  SimpleLife
//
//  Created by xhp on 15/10/27.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLUrlController.h"

#import "AFNetworking.h"

@interface SLUrlController ()<UIWebViewDelegate>

@property (nonatomic,weak) UIWebView *webView;
@property (nonatomic,weak) UIActivityIndicatorView *indicator;

@end

@implementation SLUrlController

#pragma mark -加载
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToPre)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // 添加webview
    [self setupWebview];
    
    // 添加UIActivityIndicatorView
    [self setupActivityIndicator];
    
    // 加载网页
    [self loadWebViewUrl:self.url];

}

- (void)backToPre
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (void)dealloc
{
    // 释放webview内存
    [self.webView loadHTMLString:@"" baseURL:nil];
    [self.webView stopLoading];
    self.webView.delegate = nil;
    [self.webView removeFromSuperview];
    self.webView = nil;
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
}

#pragma mark -添加webview
- (void)setupWebview
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.bounces = NO;
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
}

#pragma mark -添加setupActivityIndicator
- (void)setupActivityIndicator
{
    //初始化:
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    //设置显示位置
    [indicator setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3)];
    //设置背景色
    indicator.backgroundColor = [UIColor grayColor];
    //设置背景透明
    indicator.alpha = 0.5;
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    
    [self.view addSubview:indicator];
    self.indicator = indicator;
    self.indicator.hidden = YES;
}

#pragma mark - 加载网页
- (void)loadWebViewUrl:(NSString *) Url
{
    NSURL *url = [NSURL URLWithString:Url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
    self.indicator.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    
}

//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络有点慢哦..." message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//    [alertView show];
//}

@end







