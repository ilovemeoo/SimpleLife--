//
//  SLImages.m
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import "SLImages.h"
#import "SLImagesUrl.h"

#import "UIImageView+WebCache.h"

@implementation SLImages

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //添加3个子控件
        [self setUpAllChildView];
        
    }
    return self;
}

- (void)setUpAllChildView{
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imgV = [[UIImageView alloc] init];
        [self addSubview:imgV];
    }
}

- (void)setImage_urls:(NSArray *)image_urls
{
    _image_urls = image_urls;
    
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        
        UIImageView *imageV = self.subviews[i];
        if (i < _image_urls.count) {//显示
            
            imageV.hidden = NO;
            SLImagesUrl *imageUrl = _image_urls[i];
            [imageV sd_setImageWithURL:[NSURL URLWithString:imageUrl.url] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            
        } else {//隐藏
            imageV.hidden = YES;
        }
        
    }
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat W = 0;
    CGFloat H = self.bounds.size.height;
    if (_image_urls.count == 1) {
        W = self.bounds.size.width;
        for (int i = 0; i < _image_urls.count; i++) {
            UIImageView *imageV = self.subviews[i];
            imageV.frame = CGRectMake(x, y, W, H);
        }
        
    }else{
        W = (self.bounds.size.width - 5 * 2) / 3;
        for (int i = 0; i < _image_urls.count; i++) {
            UIImageView *imageV = self.subviews[i];
            x = i * (W + 5);
            imageV.frame = CGRectMake(x, y, W, H);
        }
    }
}

@end









