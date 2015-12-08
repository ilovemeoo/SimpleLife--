//
//  SLBankCardController.m
//  SimpleLife
//
//  Created by xhp on 15/11/10.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLBankCardController.h"
#import "SLBankCardUser.h"

@interface SLBankCardController ()

@property (weak, nonatomic) IBOutlet UITextField *bankCardText;
@property (weak, nonatomic) IBOutlet UILabel *lblCardType;
@property (weak, nonatomic) IBOutlet UILabel *lblCardPreFixNum;
@property (weak, nonatomic) IBOutlet UILabel *lblCardName;
@property (weak, nonatomic) IBOutlet UILabel *lblBankName;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

- (IBAction)searchClick;

@end

@implementation SLBankCardController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置基本属性
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backToPre)];
    
    self.searchBtn.layer.cornerRadius = 3.0;
    self.searchBtn.layer.masksToBounds = YES;
    
    self.lblDescription.numberOfLines = 0;
    
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


- (IBAction)searchClick
{
    if (self.bankCardText.text.length ){
        
        [SLBankCardUser searchWithBankCardNo:self.bankCardText.text success:^(SLBankCard *result) {

            if ([result.status  isEqual: @1]) {
                self.lblCardType.text = [NSString stringWithFormat:@"银行卡类型:%@",result.cardtype];
                self.lblCardPreFixNum.text = [NSString stringWithFormat:@"银行卡前缀:%@",result.cardprefixnum];
                self.lblCardName.text = [NSString stringWithFormat:@"银行卡名称:%@",result.cardname];
                self.lblBankName.text = [NSString stringWithFormat:@"归属银行:%@",result.bankname];
            }else{
                self.lblCardName.text = @"查询为空，请检查银行卡号是否有误！";
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    [self.bankCardText resignFirstResponder];
}
@end














