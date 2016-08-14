//
//  FAErrorDescription.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FAErrorDescription.h"

@implementation FAErrorDescription

+ (NSString *)errorWithCode:(NSInteger)code {
    if (code == 888) return nil;
#define _des_(c, des)\
    if (code == c) {\
        return @ #des;\
    }
//***************代码区****************
    _des_(0, 返回infoCode为空)
    _des_(999, 服务器异常...)
    _des_(998, 该会员已被封号所有地方返回)
    //***** 系统接口 *******
    _des_(810, 手机号或者密码为空)
    _des_(816, 账号不存在)
    _des_(811, 密码错误)
    _des_(8142, 验证码短信发送失败)
    _des_(813, 验证码失效)
    _des_(814, 验证码错误)
    _des_(8141, 验证码空)
    _des_(996, 缺少设备ID)
    
    NSString *ext = error_from_code(code);
    if (ext != nil) return ext;
    return @"error.未描述的错误";
//***************代码区****************
#undef _des_
}

@end
