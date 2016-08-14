//
//  UIViewController+FAFinancing.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/12.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "UIViewController+FAFinancing.h"

@implementation UIViewController (FAFinancing)

- (void)addNetWorkChangeAction:(SEL)selector {
    [[FARequestManager sharedFARequestManager] addNetWorkChangeWithTarget:self selector:selector];
}

- (void)addNavBarButton:(NSString *)title image:(NSString *)imageName selector:(SEL)selector inLeft:(BOOL)inLeft {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 60, 40);
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    if (inLeft) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    else
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}


- (UIView *)defaultBgView {
    UIView *defaultBgView = objc_getAssociatedObject(self, @selector(defaultBgView));
    if (!defaultBgView) {
        defaultBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_default2"]];
        defaultBgView.backgroundColor = [UIColor clearColor];
        objc_setAssociatedObject(self, @selector(defaultBgView), defaultBgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return defaultBgView;
}

- (void)addDefaultBg {
    [self.view addSubview:self.defaultBgView];
    self.defaultBgView.sd_layout.centerYEqualToView(self.view).centerXEqualToView(self.view).widthIs(200).heightIs(200);
}

- (void)removeDefaultBg {
    [self.defaultBgView removeFromSuperview];
}


@end
