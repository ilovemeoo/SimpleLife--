//
//  SLIdCardController.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLIdCardController.h"
#import "SLIdCardUser.h"

@interface SLIdCardController ()

@property (weak, nonatomic) IBOutlet UITextField *idCardNo;
@property (weak, nonatomic) IBOutlet UILabel *lblArea;
@property (weak, nonatomic) IBOutlet UILabel *lblSex;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthday;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

- (IBAction)btnSearch;

@end

@implementation SLIdCardController

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

#pragma mark - 开始查询
- (IBAction)btnSearch
{
    if (self.idCardNo.text.length ){
        
        [SLIdCardUser searchWithIdCardNo:(NSString *)self.idCardNo.text success:^(SLIdCard *result){
           
            if ([result.reason isEqualToString:@"成功地返回"]) {
                self.lblArea.text = [NSString stringWithFormat:@"地区:%@",result.area];
                self.lblSex.text = [NSString stringWithFormat:@"性别:%@",result.sex];
                self.lblBirthday.text = [NSString stringWithFormat:@"出生日期:%@",result.birthday];
            }else{
                self.lblSex.text = @"没有信息，请核对身份证号";
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    
    [self.idCardNo resignFirstResponder];
}
@end













