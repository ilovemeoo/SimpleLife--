//
//  SLIPSearchController.m
//  SimpleLife
//
//  Created by xhp on 15/11/3.
//  Copyright (c) 2015年 xhp. All rights reserved.
//

#import "SLIPSearchController.h"
#import "SLIPAdressUser.h"

@interface SLIPSearchController ()

@property (weak, nonatomic) IBOutlet UITextField *ipText;
@property (weak, nonatomic) IBOutlet UILabel *lblArea;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

- (IBAction)ipSearchBtn;

@end

@implementation SLIPSearchController

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

- (IBAction)ipSearchBtn
{
    if (self.ipText.text.length ){
        
        [SLIPAdressUser searchWithIP:self.ipText.text success:^(SLIPAdress *result) {
            if ([result.reason isEqualToString:@"Return Successd!"]) {
                self.lblLocation.text = [NSString stringWithFormat:@"位置:%@",result.location];
                self.lblArea.text = [NSString stringWithFormat:@"地区:%@",result.area];
            }else{
                self.lblArea.text = @"查询结果为空！请确认输入ip正确。";
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    [self.ipText resignFirstResponder];
}
@end









