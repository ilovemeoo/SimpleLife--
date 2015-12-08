//
//  SLSettingController.m
//  SimpleLife
//
//  Created by xhp on 15/10/26.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLSettingController.h"
#import "SLSettingCategory.h"
#import "SLSettingCell.h"
#import <MessageUI/MessageUI.h>
#import "SLAboutController.h"

#import "MBProgressHUD+MJ.h"

#define sectionHeadHeight 28

@interface SLSettingController ()<MFMailComposeViewControllerDelegate>

@property (nonatomic,strong) NSArray *sections;

@end

@implementation SLSettingController

#pragma mark - 懒加载
- (NSArray *)sections
{
    if (_sections == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"setting.plist" ofType:nil];
        NSArray *arrayTemp = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayTemp) {
            SLSettingCategory *setting = [SLSettingCategory settingWithDictionary:dict];
            [arrayM addObject:setting];
        }
        _sections = arrayM;
    }
    return _sections;
}

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName,nil]];
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionHeaderHeight = sectionHeadHeight;
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
}

#pragma mark - tableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLSettingCell *cell = [SLSettingCell cellWithTableView:tableView];
    SLSettingCategory *catagoryModel = self.sections[indexPath.section];
    cell.catagoryModel = catagoryModel;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionHeadHeight)];
    return view;
}

#pragma mark - tableView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        //清除缓存
        [self clearCache];
        
    }else if (indexPath.section == 1) {
        
        //发送邮件
        [self sendMessage];
        
    }else if (indexPath.section == 2) {
        
        //关于我们
        SLAboutController *about = [[SLAboutController alloc] init];
        
        [self presentViewController:about animated:YES completion:nil];
        
    }
}

#pragma mark - private方法
- (void)clearCache
{
    // 显示清除缓存
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"清除缓存中...";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        // 清除缓存
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        NSUInteger fileCount = [files count];
        
        for (NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        
        hud.mode = MBProgressHUDModeText;
        hud.labelText = [NSString stringWithFormat:@"清除缓存文件%ld个!",(unsigned long)fileCount];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        
    });
}

#pragma mark -------------------------------------------------------------
- (void)sendMessage
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}

- (void)displayComposerSheet
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    
    [mailPicker.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarbg_main"] forBarMetrics:UIBarMetricsDefault];
    [mailPicker.navigationBar setShadowImage:[UIImage imageNamed:@"topBarbg"]];
    
    [mailPicker.navigationBar setTintColor:[UIColor whiteColor]];
    [mailPicker.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName,nil]];
    
    mailPicker.mailComposeDelegate = self;
    
    //设置主题
    [mailPicker setSubject: @"意见反馈"];
    
    // 添加发送者
    NSArray *toRecipients = [NSArray arrayWithObject: @"1213053690@qq.com"];
    
    [mailPicker setToRecipients: toRecipients];
    
    NSString *emailBody = @"写给我们的信...";
    [mailPicker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:mailPicker animated:YES completion:nil];
}

//转到系统邮件
- (void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:first@example.com&subject=my email!";
    //@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=my email!";
    NSString *body = @"&body=email body!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}

// 邮件发送返回
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *msg;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) alertWithTitle: (NSString *)_title_ msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_title_
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

@end

















