//
//  FALoginViewController.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/10.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FALoginViewController.h"
#import "FABaseTabBarController.h"

@interface FALoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation FALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMobile:(NSString *)mobile {
    self.mobileTF.text = mobile;
}

- (void)setPassword:(NSString *)password {
    self.passwordTF.text = password;
}

- (IBAction)loginAction:(UIButton *)sender {
    [self.view endEditing:YES];
    if (stringEmpty(_mobileTF.text)) {
        [UIWindow showInfoText:@"手机号码不能为空!"];
        return;
    }
    if (stringEmpty(_passwordTF.text)) {
        [UIWindow showInfoText:@"密码不能为空!"];
        return;
    }
    if (_mobileTF.text.length != 11 || [_mobileTF.text longLongValue] == 0) {
        [UIWindow showInfoText:@"请输入正确的手机号!"];
        return;
    }
    if (_passwordTF.text.length < 6) {
        [UIWindow showInfoText:@"密码不能少于6位"];
        return;
    }
    NSDictionary *dataDict = @{@"mobile":_mobileTF.text,
                               @"passwd":[_passwordTF.text md5String],
                               };
    __SHOW_LOADING(NO)
    NSString *url = absoluteURL(rSysLoginUrl);
    NSDictionary *allDict = [FAParameters parmasPackUserData:dataDict];
    [FARequestManager postWithURLString:url parameters:allDict reponse:^(FAResponse *response) {
        __DISMISS_LOADING
        if (response.isSuccess) {
            __SHOW_SUCCESS(@"登陆成功");
            [[FAAccountManager sharedFAAccountManager] loginSetupAccount:dataDict];
            fa_dispatch_after(0.2, ^{
                UIViewController *tabBar = [[FABaseTabBarController alloc] init];
                kKEY_WINDOW.rootViewController = tabBar;
                [UIView transitionWithView:kKEY_WINDOW duration:0.4 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
            });
        }
        else {
            __SHOW_FAILD(response.errorDescription)
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
