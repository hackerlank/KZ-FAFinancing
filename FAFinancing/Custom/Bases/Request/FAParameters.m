//
//  FAParametersManager.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FAParameters.h"

@implementation FAParameters

+ (NSDictionary *)parmasPackUserData:(NSDictionary *)userDict {
    return @{
             @"DataRoot":@{
                     @"User":userDict
                     }
             };
}

+ (NSDictionary *)paramsHasAccWithData:(NSDictionary *)dataDict {
    FAAccount *account = [FAAccountManager sharedFAAccountManager].account;
    if (account == nil) return nil;
    
    NSDictionary *params = @{
                             @"DataRoot":@{
                                     @"Data":dataDict,
                                     @"User":@{
                                             @"passwd":account.passwd,
                                             @"mobile":account.mobile
                                             }
                                     }
                             };
    return params;
}

+ (NSDictionary *)paramsNoAccWithData:(NSDictionary *)dataDict {
    NSDictionary *params = @{
                             @"DataRoot":@{
                                     @"Data":dataDict
                                     }
                             };
    return params;
}


+ (NSDictionary *)testDict {
    return @{
             @"DataRoot":@{
                     @"Data":@{@"userName":@"🙄🤓😎😳😰😯111",
                               @"sex":@"1",
                               },
                     @"User":@{
                             @"passwd":@"11111111111",
                             @"mobile":@"123456"
                             }
                     }
             };
}
@end
