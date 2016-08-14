//
//  FAErrorDescription.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAErrorDescription : NSObject

/// 状态码对应的错误解释
+ (NSString *)errorWithCode:(NSInteger)code;

@end
