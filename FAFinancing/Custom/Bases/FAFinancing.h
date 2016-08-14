//
//  FAFinancing.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  用来记录应用的一些属性
 */
@interface FAFinancing : NSObject
single_interface(FAFinancing)

@end


@interface FAFinancing (StaticFunc)
/*!
 *  加载Primary SB里面的viewcontroller
 *
 *  @param identifier id
 *
 *  @return vc
 */
+ (UIViewController *)primaryStoryBoardViewControllerWithIdentifier:(NSString *)identifier;

/*!
 *  加载Secondary SB里面的viewcontroller
 *
 *  @param identifier id
 *
 *  @return vc
 */
+ (UIViewController *)secondaryStoryBoardViewControllerWithIdentifier:(NSString *)identifier;

/*!
 *  加载LoginRegister SB里面的viewcontroller
 *
 *  @param identifier id
 *
 *  @return vc
 */
+ (UIViewController *)loginRegisterStoryBoardViewControllerWithIdentifier:(NSString *)identifier;

@end