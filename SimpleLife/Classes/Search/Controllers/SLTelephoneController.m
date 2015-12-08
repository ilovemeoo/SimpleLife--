//
//  SLTelephoneController.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLTelephoneController.h"
#import "SLTelephoneUser.h"

@interface SLTelephoneController ()

@property (weak, nonatomic) IBOutlet UITextField *telephoneNo;
@property (weak, nonatomic) IBOutlet UILabel *lblArea;
@property (weak, nonatomic) IBOutlet UILabel *lblCompany;
@property (weak, nonatomic) IBOutlet UILabel *lblCardType;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

- (IBAction)telephoneBtn;

@end

@implementation SLTelephoneController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backToPre)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    self.searchBtn.layer.cornerRadius = 3.0;
    self.searchBtn.layer.masksToBounds = YES;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tap:(UIGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}

- (void)backToPre
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)telephoneBtn
{
    if (self.telephoneNo.text.length ){
        
        [SLTelephoneUser searchWithPhoneNo:[self.telephoneNo.text intValue] success:^(SLTelephone *result) {
            if ([result.reason isEqualToString:@"Return Successd!"]) {
                self.lblArea.text = [NSString stringWithFormat:@"地区:%@-%@",result.province,result.city];
                self.lblCompany.text = [NSString stringWithFormat:@"公司:%@",result.company];
                self.lblCardType.text = [NSString stringWithFormat:@"卡类型:%@",result.card];
            }else{
                self.lblCompany.text = @"查询结果为空！请确认号码为前7位。";
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    [self.telephoneNo resignFirstResponder];
}
@end








