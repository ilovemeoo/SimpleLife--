//
//  SLNearbyCatagory.h
//  SimpleLife
//
//  Created by xhp on 15/11/4.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNearbyCatagory : NSObject

@property (nonatomic,strong) NSNumber *cat_id;
@property (nonatomic,copy) NSString *cat_name;
@property (nonatomic,copy) NSString *cat_image;
@property (nonatomic,strong) NSArray *subcategories;

- (instancetype)initWithDictionary:(NSDictionary *) dic;
+ (instancetype)catagoryWithDictionary:(NSDictionary *) dic;

@end




