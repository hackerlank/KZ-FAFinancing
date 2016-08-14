//
//  FAFinancing.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FAFinancing.h"
#import <AFNetworking/AFNetworking.h>

@interface FAFinancing()
@end

@implementation FAFinancing
single_implementation(FAFinancing)
- (instancetype)init {
    if (self = [super init]) {
        // TODO: -
    }
    return self;
}


@end


@implementation FAFinancing(StaticFunc)

+ (UIViewController *)primaryStoryBoardViewControllerWithIdentifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:@"Primary" bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

+ (UIViewController *)secondaryStoryBoardViewControllerWithIdentifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:@"Secondary" bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

+ (UIViewController *)loginRegisterStoryBoardViewControllerWithIdentifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

@end