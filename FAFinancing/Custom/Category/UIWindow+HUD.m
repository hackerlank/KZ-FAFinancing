//
//  UIWindow+HUD.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "UIWindow+HUD.h"

@implementation UIWindow (HUD)

static const char *hudKey;
- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, hudKey);
}
- (void)setHUD:(MBProgressHUD *)HUD {
    objc_setAssociatedObject(self, hudKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)showLoading:(BOOL)interaction {
    UIWindow *window = kKEY_WINDOW;
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:window animated:YES];
    HUD.label.text = @"请等待...";
    HUD.userInteractionEnabled = !interaction;
    if (!interaction) {
        HUD.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
    }
    window.HUD = HUD;
}

+ (void)dismissLoading {
    UIWindow *window = kKEY_WINDOW;
    [window.HUD hideAnimated:YES];
}

+ (void)showSuccess:(NSString *)text {
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [self showCustomView:imgView text:text];
}

+ (void)showFaild:(NSString *)text {
    UIImage *image = [[UIImage imageNamed:@"errorMark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [self showCustomView:imgView text:text];
}

+ (void)showCustomView:(UIView *)cusView text:(NSString *)text{
    UIWindow *keyWindow = kKEY_WINDOW;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = cusView;
    hud.square = YES;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:kHUD_TIME];
}

+ (void)showInfoText:(NSString *)text {
    UIWindow *keyWindow = kKEY_WINDOW;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.offset = CGPointMake(0.f, 0);
    [hud hideAnimated:YES afterDelay:kHUD_TIME];
}

@end
