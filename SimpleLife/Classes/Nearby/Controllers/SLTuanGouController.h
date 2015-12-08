//
//  SLTuanGouController.h
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPerCity.h"
#import "SLNearbyCatagory.h"

@interface SLTuanGouController : UIViewController

@property (nonatomic,strong) SLPerCity *selectedCity;
@property (nonatomic,strong) SLNearbyCatagory *selectedCategory;

@end
