//
//  SLHotNews.m
//  SimpleLife
//
//  Created by xhp on 15/12/5.
//  Copyright © 2015年 xhp. All rights reserved.
//

#import "SLHotNews.h"
#import "NSDate+MJ.h"
#import "SLImagesUrl.h"

@implementation SLHotNews

+ (NSDictionary *)objectClassInArray
{
    return @{@"imageurls":[SLImagesUrl class]};
}

- (NSString *)pubDate
{
    // 字符串转换NSDate
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create_at = [dateF dateFromString:_pubDate];
    
    if ([create_at isThisYear]) {//是今年
        
        if ([create_at isToday]) {//今天
            
            NSDateComponents *dateCp = [create_at deltaWithNow];
            
            if (dateCp.hour > 1) {
                return [NSString stringWithFormat:@"%ld小时前",(long)dateCp.hour];
            }else if(dateCp.minute > 1){
                return [NSString stringWithFormat:@"%ld分钟前",(long)dateCp.minute];
            }else{
                return [NSString stringWithFormat:@"刚刚"];
            }

        } else if([create_at isYesterday]){//昨天
            dateF.dateFormat = @"昨天 HH:mm";
            return [dateF stringFromDate:create_at];
            
        }else{//其他
            dateF.dateFormat = @"MM-dd";
            return [dateF stringFromDate:create_at];
        }
    }else{//不是今年
        dateF.dateFormat = @"yyyy-MM-dd";
        return [dateF stringFromDate:create_at];
    }
}

@end








