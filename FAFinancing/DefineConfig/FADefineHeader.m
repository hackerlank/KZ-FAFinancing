//
//  FADefineHeader.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FADefineHeader.h"

void fa_asyn_mian_queue(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void fa_dispatch_after(float delay, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(),block);
}

bool stringEmpty(NSString *text) {
    if (text == nil) return true;
    NSString *newString = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (newString.length == 0) return true;
    return false;
}

