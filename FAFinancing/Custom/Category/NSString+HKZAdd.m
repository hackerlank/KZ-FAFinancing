//
//  NSString+HKZAdd.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/10.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "NSString+HKZAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HKZAdd)

- (NSString *)md5String {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    // CC_MD5( cStr, strlen(cStr), digest ); 这里的用法明显是错误的，但是不知道为什么依然可以在网络上得以流传。当srcString中包含空字符（\0）时
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02X", digest[i]];
    return result;
}

@end
