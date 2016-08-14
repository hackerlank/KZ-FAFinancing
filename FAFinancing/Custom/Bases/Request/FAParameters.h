//
//  FAParametersManager.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求参数的封装
 */
@interface FAParameters : NSObject

///对自定义User的封装
+ (NSDictionary *)parmasPackUserData:(NSDictionary *)userDict;

///包含用户信息的数据封装...没登陆则返回 nil
+ (NSDictionary *)paramsHasAccWithData:(NSDictionary *)dataDict;

/// 不包含用户信息的数据封装
+ (NSDictionary *)paramsNoAccWithData:(NSDictionary *)dataDict;

@end
