//
//  UIViewController+FAFinancing.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/12.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FAFinancing)

@property (nonatomic, strong, readonly) UIView *defaultBgView;
/*!
 *  添加默认背景
 */
- (void)addDefaultBg;
/*!
 *  移除默认背景
 */
- (void)removeDefaultBg;

/*!
 *  导航条添加按钮
 *
 *  @param title     标题
 *  @param imageName imag
 *  @param selector  回调方法
 *  @param inLeft    左边还是右边
 */
- (void)addNavBarButton:(NSString *)title image:(NSString *)imageName selector:(SEL)selector inLeft:(BOOL)inLeft;

/*!
 *  添加网络监测
 *
 *  @param selector ' - (void)netChangeAction:(FANetWorkStatus)status '
 */
- (void)addNetWorkChangeAction:(SEL)selector;

@end
