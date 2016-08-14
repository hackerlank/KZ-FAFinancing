//
//  FARegisterViewController.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/9.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FARegisterViewController.h"
#import "FALoginViewController.h"

@interface FARegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *verCodeTF;

@end

@implementation FARegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getVCodeAction:(UIButton *)sender {
    __SHOW_INFO(@"验证码暂时不可用");
}
- (IBAction)confirmAction:(id)sender {
    [self.view endEditing:YES];
    if (stringEmpty(_mobileTF.text) || _mobileTF.text.length != 11) {
        __SHOW_INFO(@"手机号输入不正确")
        return;
    }
    if (stringEmpty(_passwordTF.text)) {
        __SHOW_INFO(@"密码不能为空")
        return;
    }
    if (stringEmpty(_verCodeTF.text)) {
        __SHOW_INFO(@"请填写验证码")
        return;
    }
    NSDictionary *dataDic = @{
                              @"mobile":_mobileTF.text,
                              @"vcode":_verCodeTF.text,
                              @"passwd":_passwordTF.text.md5String,
                              @"deviceId":[[UIDevice currentDevice].identifierForVendor UUIDString]
                              };
    NSDictionary *allDict = [FAParameters paramsNoAccWithData:dataDic];
    NSString *urlString = absoluteURL(rSysRegisterUrl);
    __SHOW_LOADING(NO)
    [FARequestManager postWithURLString:urlString parameters:allDict reponse:^(FAResponse *response) {
        __DISMISS_LOADING
        if (response.isSuccess) {
            [self showSuccess:@"注册成功!,去登陆"];
            fa_dispatch_after(1.0, ^{
                FALoginViewController *loginVC = [self.navigationController .viewControllers firstObject];
                if ([loginVC isKindOfClass:[FALoginViewController class]]) {
                    loginVC.mobile = _mobileTF.text;
                    loginVC.password = _passwordTF.text;
                }
                [self.navigationController popToViewController:loginVC animated:YES];
            });
        }
        else {
            __SHOW_INFO(response.errorDescription);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
