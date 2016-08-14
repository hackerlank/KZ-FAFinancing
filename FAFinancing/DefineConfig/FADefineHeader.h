//
//  FADefineHeader.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef FADefineHeader_h
#define FADefineHeader_h

#pragma mark - Function -
//********** Function ****************

extern void fa_asyn_mian_queue(dispatch_block_t block);

extern void fa_dispatch_after(float delay, dispatch_block_t block);

extern bool stringEmpty(NSString *text);


#pragma mark - String -
//************ String ******************
///账号是否登录 k
static NSString *kACCOUNT_DIDLOGIN  = @"didLogin";

///投资方的名称
static NSString *const kINVERST_NAME    = @"投资方";
/// 融资方名称
static NSString *const kACCEPT_NAME     = @"标的方";

#pragma mark - Import -
//************ import ******************
#import "FADeFineHeader_EXT.h"
#import "UINavigationController+WXSTransition.h"
#import "EXTView.h"

#import "FAAccountManager.h"
#import "FAAccount.h"
#import "FAParameters.h"
#import "FAFinancing.h"
#import "NSString+HKZAdd.h"
#import "UIViewController+HUD.h"
#import "UIViewController+FAFinancing.h"

#pragma mark - Define -
//************** Define ****************

#define kDEFAULT_IMAGE      [UIImage imageNamed:@"app_icon"]
#define kDEFAULT_HEADER     [UIImage imageNamed:@"app_icon"]

#define kTHEME_COLOR        [UIColor yellowColor]

//----- HUD ----
#define __SHOW_LOADING(c)       [UIWindow showLoading:c];       //loading
#define __DISMISS_LOADING       [UIWindow dismissLoading];      //隐藏 loading
#define __SHOW_INFO(text)       [UIWindow showInfoText:text];   // info
#define __SHOW_FAILD(text)      [UIWindow showFaild:text];      // 失败
#define __SHOW_SUCCESS(text)    [UIWindow showSuccess:text];    // 成功


#pragma mark - Request URL -
//************** Request URL ****************
/// 请求路径的拼接  写成静态的 速度快
static NSString *const rBaseRootUrl = @"https://192.168.1.119:898/financing/mobile/";
static inline NSString* absoluteURL(NSString *suffix) {
    return [NSString stringWithFormat:@"%@%@",rBaseRootUrl, suffix];
}
//------- 系统接口 -------
///系统 登陆
#define rSysLoginUrl            @"user/vlogin"
///用户信息编辑
#define rSysEditInfoUrl         @"user/edit/info"
///注册
#define rSysRegisterUrl         @"user/reg"



#endif
