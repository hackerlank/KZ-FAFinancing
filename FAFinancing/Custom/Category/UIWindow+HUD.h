//
//  UIWindow+HUD.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHUD_TIME   2.0f  //提示的时间
@interface UIWindow (HUD)

@property (nonatomic)MBProgressHUD *HUD;
/*!
 *  loading
 *
 *  @param interaction 是否能点击
 */
+ (void)showLoading:(BOOL)interaction;
/*!
 *  隐藏Loading
 */
+ (void)dismissLoading;
/*!
 *  成功
 *
 *  @param text text
 */
+ (void)showSuccess:(NSString *)text;
/*!
 *  失败
 *
 *  @param text text
 */
+ (void)showFaild:(NSString *)text;
/*!
 *  文字
 *
 *  @param text text
 */
+ (void)showInfoText:(NSString *)text;
@end
