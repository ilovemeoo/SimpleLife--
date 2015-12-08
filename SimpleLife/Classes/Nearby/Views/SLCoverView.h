//
//  SLCoverView.h
//  SimpleLife
//
//  Created by xhp on 15/11/7.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLCoverView : UIView

+ (id)cover;

+ (id)coverWithTarget:(id)target action:(SEL)action;

- (void)reset;

@end
