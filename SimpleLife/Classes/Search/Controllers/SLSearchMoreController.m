//
//  SLSearchMoreController.m
//  SimpleLife
//
//  Created by xhp on 15/10/27.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSearchMoreController.h"
#import "SLIdCardController.h"
#import "SLTelephoneController.h"
#import "SLIPSearchController.h"
#import "SLBankCardController.h"
#import "SLTripListController.h"
#import "SLWeixinController.h"

@interface SLSearchMoreController ()


@end

@implementation SLSearchMoreController

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName,nil]];
}

#pragma mark - tableView的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SLIdCard" bundle:nil];
        SLIdCardController *idCard = [storyboard instantiateViewControllerWithIdentifier:@"SLIdCard"];
        idCard.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:idCard animated:YES];
        
    }else if (indexPath.section == 1) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SLTelephone" bundle:nil];
        SLTelephoneController *telephone = [storyboard instantiateViewControllerWithIdentifier:@"SLTelephone"];
        telephone.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:telephone animated:YES];
        
    }else if (indexPath.section == 2) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SLIPSearch" bundle:nil];
        SLIPSearchController *ipSearch = [storyboard instantiateViewControllerWithIdentifier:@"SLIPSearch"];
        ipSearch.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ipSearch animated:YES];
        
    }else if (indexPath.section == 3) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SLBankCard" bundle:nil];
        SLBankCardController *bankCard = [storyboard instantiateViewControllerWithIdentifier:@"SLBankCard"];
        bankCard.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bankCard animated:YES];
        
    }else if (indexPath.section == 4) {
        
        SLTripListController *trip = [[SLTripListController alloc] init];
        trip.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:trip animated:YES];
        
    }else if (indexPath.section == 5) {
        
        SLWeixinController *weixin = [[SLWeixinController alloc] init];
        weixin.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:weixin animated:YES];
        
    }
}

@end












