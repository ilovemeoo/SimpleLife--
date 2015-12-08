//
//  SLDealUser.h
//  SimpleLife
//
//  Created by xhp on 15/11/8.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLDealUser : NSObject

+ (void)getDealWithCityId:(NSNumber *)city_id districtId:(NSNumber *)district_id categoryId:(NSNumber *)category_id subCategoryId:(NSNumber *)subCategory_id page:(int)page success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;

@end
