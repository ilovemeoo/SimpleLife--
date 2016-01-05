//
//  SLMainController.m
//  SimpleLife
//
//  Created by xhp on 15/11/1.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLMainController.h"
#import "SLNewsController.h"
#import "SLHotNewsController.h"
#import "SLDomesticNewsController.h"
#import "SLInterNationalNewsController.h"
#import "SLMilitaryNewsController.h"
#import "SLFinantialNewsController.h"
#import "SLTechnologicalNewsController.h"

#import "SLTopBar.h"
#import "SLScrollView.h"

#define topBarWidth [UIScreen mainScreen].bounds.size.width
#define navigationBarY CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define scrollWidth CGRectGetWidth(self.scrollView.frame)
#define scrollHeight CGRectGetHeight(self.scrollView.frame)

@interface SLMainController ()<SLTopBarDelegate,UIScrollViewDelegate>

/**
 *  储存scrollView里的控制器
 */
@property (nonatomic,strong) NSArray *scrollViewController;
@property (nonatomic,strong) SLScrollView *scrollView;
@property (nonatomic,strong) SLTopBar *topBar;

@property (nonatomic,assign) BOOL shouldObserveContentOffset;
@property (nonatomic,assign) NSUInteger topBarHeight;
@property (nonatomic,assign) NSUInteger btnSelected;
@property (nonatomic,strong) UIColor *pageItemsTitleColor;
@property (nonatomic,strong) UIColor *selectedPageItemTitleColor;

@end

@implementation SLMainController

#pragma mark - 懒加载
- (NSArray *)scrollViewController
{
    if (_scrollViewController == nil) {
        _scrollViewController = [NSArray array];
    }
    return _scrollViewController;
}

#pragma mark - 初始化
- (id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    //设置基本属性
    self.btnSelected = 0;
    self.pageItemsTitleColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
    self.selectedPageItemTitleColor = [UIColor whiteColor];
}

- (void)dealloc
{
    if (self.scrollView) {
        [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)viewDidUnload
{
    [self stopObservingContentOffset];
    self.topBar = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.shouldObserveContentOffset = YES;
    
    //基本属性
    self.view.backgroundColor      = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];

    UIBlurEffect *blur             = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame               = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    [self.view addSubview:effectview];

    //创建控制器数组
    [self setUpAllControllers];

    //添加topBar
    SLTopBar *topBar               = [[SLTopBar alloc] initWithFrame:CGRectMake(0, 0, topBarWidth, self.navigationController.navigationBar.bounds.size.height)];
    topBar.itemTitles              = [self.scrollViewController valueForKey:@"title"];
    topBar.itemTitleColor          = self.pageItemsTitleColor;
    [topBar.itemBtns[self.btnSelected] setTitleColor:self.selectedPageItemTitleColor forState:UIControlStateNormal];
    topBar.delegate                = self;
    self.navigationItem.titleView  = topBar;
    self.topBar                    = topBar;

    //添加scrollView
    SLScrollView *scrollView       = [[SLScrollView alloc] initWithFrame:CGRectMake(0, navigationBarY, topBarWidth, self.view.bounds.size.height - navigationBarY - 44)];
    scrollView.viewControllers     = self.scrollViewController;
    scrollView.delegate            = self;
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:0 context:nil];
    [self.view addSubview:scrollView];
    self.scrollView                = scrollView;
    
}

- (void)setUpAllControllers
{
    //创建新浪新闻控制器
    SLNewsController *news         = [[SLNewsController alloc] init];
    news.title                     = @"新闻门户";
    
    //创建精选新闻控制器
    SLHotNewsController *hotNews = [[SLHotNewsController alloc] init];
    hotNews.title                 = @"热门";
    
    //创建国内控制器
    SLDomesticNewsController *domesticNews = [[SLDomesticNewsController alloc] init];
    domesticNews.title = @"国内";
    
    //创建国际焦点控制器
    SLInterNationalNewsController *interNationalNews = [[SLInterNationalNewsController alloc] init];
    interNationalNews.title = @"国际";
    
    //创建军事控制器
    SLMilitaryNewsController *militaryNews = [[SLMilitaryNewsController alloc] init];
    militaryNews.title = @"军事";
    
    //创建财经控制器
    SLFinantialNewsController *finantialNews = [[SLFinantialNewsController alloc] init];
    finantialNews.title = @"财经";
    
    //创建科技控制器
    SLTechnologicalNewsController *technologicalNews = [[SLTechnologicalNewsController alloc] init];
    technologicalNews.title = @"科技";

    self.scrollViewController      = @[news,hotNews,domesticNews,interNationalNews,militaryNews,finantialNews,technologicalNews];
}

#pragma mark - TopBar代理方法
- (void)itemBtnWithIndex:(NSUInteger)index didSelectInTopBar:(SLTopBar *) topBar
{
    [self setSelectedIndex:index animated:YES];
}

#pragma mark - UIScrollView代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        self.btnSelected = scrollView.contentOffset.x / scrollWidth;
        self.scrollView.userInteractionEnabled = YES;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        self.scrollView.userInteractionEnabled = YES;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.scrollView.userInteractionEnabled = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.scrollView.userInteractionEnabled = NO;
}

#pragma mark - private方法
- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated
{
    //关闭拖动监听
    self.shouldObserveContentOffset = NO;
    NSAssert(selectedIndex < self.topBar.itemBtns.count, @"selectedIndex should belong within the range of the view controllers array");
    UIButton *preBtn = self.topBar.itemBtns[self.btnSelected];
    UIButton *curBtn = self.topBar.itemBtns[selectedIndex];
    
    [self.scrollView setContentOffset:CGPointMake(selectedIndex * scrollWidth, 0) animated:NO];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.topBar.contentOffset = [self.topBar contentOffsetForSelectedItemAtIndex:selectedIndex];
        [preBtn setTitleColor:self.pageItemsTitleColor forState:UIControlStateNormal];
        [preBtn setTitleColor:self.pageItemsTitleColor forState:UIControlStateSelected];
        [curBtn setTitleColor:self.selectedPageItemTitleColor forState:UIControlStateNormal];
        
    } completion:^(BOOL finished) {
        //打开监听以及设置交互
        self.shouldObserveContentOffset = YES;
        self.scrollView.userInteractionEnabled = YES;
    }];
    self.btnSelected = selectedIndex;
}

- (void)stopObservingContentOffset
{
    if (self.scrollView) {
        [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
        self.scrollView = nil;
    }
}

#pragma mark - 设置KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat oldX = self.btnSelected * scrollWidth;
    if (oldX != self.scrollView.contentOffset.x && self.shouldObserveContentOffset) {
        
        BOOL scrollingTowards = (self.scrollView.contentOffset.x > oldX);
        NSInteger targetIndex = (scrollingTowards) ? self.btnSelected + 1 : self.btnSelected - 1;
        
        if (targetIndex >= 0 && targetIndex < self.scrollViewController.count) {
            
            CGFloat ratio = (self.scrollView.contentOffset.x - oldX) / scrollWidth;
            CGFloat preBtnContentOffsetX = [self.topBar contentOffsetForSelectedItemAtIndex:self.btnSelected].x;
            CGFloat nextBtnContentOffsetX = [self.topBar contentOffsetForSelectedItemAtIndex:targetIndex].x;
            
            UIButton *preSelectedBtn = self.topBar.itemBtns[self.btnSelected];
            UIButton *nextSelectedBtn = self.topBar.itemBtns[targetIndex];
            
            CGFloat red, green, blue, alpha, highlightedRed, highlightedGreen, highlightedBlue, highlightedAlpha;
            [self getRed:&red green:&green blue:&blue alpha:&alpha fromColor:self.pageItemsTitleColor];
            [self getRed:&highlightedRed green:&highlightedGreen blue:&highlightedBlue alpha:&highlightedAlpha fromColor:self.selectedPageItemTitleColor];
            
            CGFloat absRatio = fabs(ratio);
            UIColor *prev = [UIColor colorWithRed:red * absRatio + highlightedRed * (1 - absRatio)
                                            green:green * absRatio + highlightedGreen * (1 - absRatio)
                                             blue:blue * absRatio + highlightedBlue  * (1 - absRatio)
                                            alpha:alpha * absRatio + highlightedAlpha  * (1 - absRatio)];
            UIColor *next = [UIColor colorWithRed:red * (1 - absRatio) + highlightedRed * absRatio
                                            green:green * (1 - absRatio) + highlightedGreen * absRatio
                                             blue:blue * (1 - absRatio) + highlightedBlue * absRatio
                                            alpha:alpha * (1 - absRatio) + highlightedAlpha * absRatio];
            
            [preSelectedBtn setTitleColor:prev forState:UIControlStateNormal];
            [nextSelectedBtn setTitleColor:next forState:UIControlStateNormal];
            
            if (scrollingTowards) {
                self.topBar.contentOffset = CGPointMake(preBtnContentOffsetX +
                                                                   (nextBtnContentOffsetX - preBtnContentOffsetX) * ratio , 0);
            } else {
                self.topBar.contentOffset = CGPointMake(preBtnContentOffsetX -
                                                                   (nextBtnContentOffsetX - preBtnContentOffsetX) * ratio , 0);
            }
        }
    }
}

- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha fromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor));
    if (colorSpaceModel == kCGColorSpaceModelRGB && CGColorGetNumberOfComponents(color.CGColor) == 4) {
        *red = components[0];
        *green = components[1];
        *blue = components[2];
        *alpha = components[3];
    } else if (colorSpaceModel == kCGColorSpaceModelMonochrome && CGColorGetNumberOfComponents(color.CGColor) == 2) {
        *red = *green = *blue = components[0];
        *alpha = components[1];
    } else {
        *red = *green = *blue = *alpha = 0;
    }
}

@end












