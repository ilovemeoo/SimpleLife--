//
//  SLJokesCell.m
//  SimpleLife
//
//  Created by xhp on 15/10/30.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLJokesCell.h"

#import "UIImageView+WebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@interface SLJokesCell ()

@property (nonatomic,weak)  UIView *view;
@property (nonatomic,weak)  UILabel *lblTime;
@property (nonatomic,weak)  UILabel *lblContent;
@property (nonatomic,weak)  UIImageView *imageV;

@end

@implementation SLJokesCell

-(void)setJokesF:(SLJokesFrame *)jokesF
{
    _jokesF = jokesF;
    
    //传递数据
    self.view.frame = jokesF.viewFrame;
    
    self.lblTime.frame = jokesF.updateTimeFrame;
    self.lblTime.text = jokesF.joke.updatetime;
    
    self.lblContent.frame = jokesF.contentFrame;
    self.lblContent.text = jokesF.joke.content;
    
    self.imageV.frame = jokesF.imageFrame;
    [self.imageV sd_setImageWithURL:jokesF.joke.url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];

}

#pragma mark - 类方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"joke";
    id cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 创建cell
//注意：cell是用此方法初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setUpAllChildView
{
    //view
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 1.0;
    view.layer.masksToBounds = YES;
    _view = view;
    
    //时间
    UILabel *lblTime = [[UILabel alloc] init];
    lblTime.font = [UIFont systemFontOfSize:13];
    lblTime.textColor = [UIColor orangeColor];
    _lblTime = lblTime;
    [view addSubview:lblTime];
    
    //正文
    UILabel *lblContent = [[UILabel alloc] init];
    lblContent.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
    lblContent.numberOfLines = 0;
    lblContent.font = [UIFont systemFontOfSize:15];
    _lblContent = lblContent;
    [view addSubview:lblContent];
    
    //图片
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageV addGestureRecognizer:tap];
    _imageV = imageV;
    [view addSubview:imageV];
    
    [self addSubview:view];
}

#pragma mark - 点击图片调用
- (void)tap:(UIGestureRecognizer *)tap
{
    MJPhoto *p = [[MJPhoto alloc] init];
    p.url = self.jokesF.joke.url;
    p.srcImageView = (UIImageView *)tap.view;
    NSArray *imageArray = @[p];
    // 弹出图片浏览器
    // 创建浏览器对象
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    brower.photos = imageArray;
    [brower show];
}



@end









