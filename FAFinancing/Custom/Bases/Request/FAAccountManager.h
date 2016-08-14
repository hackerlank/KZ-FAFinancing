//
//  FAAccountManager.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAAccount.h"
@interface FAAccountManager : NSObject
single_interface(FAAccountManager)

/// account 为nil 则未登录
@property (nonatomic, strong, readonly) FAAccount *account;
/// 登录请求后的赋值
- (void)loginSetupAccount:(NSDictionary *)accInfoDic;
/// 是否登录
- (BOOL)isLogin;
/// 退出登录
- (void)exitAccount;
@end
