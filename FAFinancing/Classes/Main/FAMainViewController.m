//
//  FAMainViewController.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/9.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FAMainViewController.h"

@interface FAMainViewController ()

@end

@implementation FAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNetWorkChangeAction:@selector(workCangeAction:)];
    
    [self addDefaultBg];
    DDLogInfo(@"这里是正常信息");
    DDLogWarn(@"这里是警告");
    DDLogError(@"这里是错误信息......出错了");
}

- (void)workCangeAction:(FANetWorkStatus)status {
    NSString *string = nil;
    switch (status) {
        case FANetWorkStatusNon:
            string = @"当前没有网络";
            break;
        case FANetWorkStatusWIFI:
            string = @"您已切换到WiFi";
            break;
        case FANetWorkStatusWWAN:
            string = @"您已切换到3G/4G";
            break;
        default:
            string = @"网络是什么,我不知道";
            break;
    }
    [UIWindow showInfoText:string];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitAction:(id)sender {
    [[FAAccountManager sharedFAAccountManager] exitAccount];
    UIViewController *loginNav = [FAFinancing loginRegisterStoryBoardViewControllerWithIdentifier:@"LoginNavgation"];
    kKEY_WINDOW.rootViewController = loginNav;
    [UIView transitionWithView:kKEY_WINDOW duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
