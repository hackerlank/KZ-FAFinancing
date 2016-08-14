//
//  FAAccountManager.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FAAccountManager.h"

@implementation FAAccountManager
@synthesize account = _account;

single_implementation(FAAccountManager)

- (instancetype)init {
    if (self = [super init]) {
        _account = [[FAAccount alloc] init];
    }
    return self;
}

- (void)loginSetupAccount:(NSDictionary *)accInfoDic {
    for (NSString *dicKey in [accInfoDic allKeys]) {
        NSString *value = [accInfoDic objectForKey:dicKey];
        if (!value)
            continue;
        if (![value isKindOfClass:[NSNull class]] && ![value isKindOfClass:[NSDictionary class]]) {
            [_account setValue:value forKey:dicKey];
        }
    }
    [self didLogin];
}

///设置已经登录
- (void)didLogin {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kACCOUNT_DIDLOGIN];
}

- (void)exitAccount {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kACCOUNT_DIDLOGIN];
    [self clearAllDate];
}

- (void)clearAllDate {
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([FAAccount class], &propertyCount);
    for (int i=0; i<propertyCount; i++) {
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [_account setValue:@"" forKey:propertyName];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:propertyName];
    }
    free(propertyList);
}

- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kACCOUNT_DIDLOGIN];
}

- (FAAccount *)account {
    if (![self isLogin]) return nil;
    
    if (stringEmpty(_account.mobile)) {
        unsigned int property_count;
        objc_property_t *property_t = class_copyPropertyList([FAAccount class], &property_count);
        for (int i=0; i<property_count; i++) {
            objc_property_t property = property_t[i];
            NSString *property_string_name = [NSString stringWithUTF8String:property_getName(property)];
            id accountValue = [[NSUserDefaults standardUserDefaults] objectForKey:property_string_name];
            if (!accountValue)
                continue;
            else
                [_account setValue:accountValue forKey:property_string_name];
        }
        free(property_t);
    }
    return _account;
}

@end
