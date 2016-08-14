//
//  FAUtil.h
//  
//
//  Created by HouKangzhu on 15/5/7.
//  Copyright (c) 2015年 侯康柱 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FAUtil : NSObject

//创建label
+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建UIImageView
+ (UIImageView *)createImageView:(CGRect)frame imageName:(NSString *)imageName;

//按钮
+ (UIButton *)createBtnFrame:(CGRect)frame
                       image:(NSString *)image
                 selectImage:(NSString *)selectImageName
                      target:(id)target
                      action:(SEL)action;

//输入框
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                          placeHolder:(NSString *)placeHolder
                                isPwd:(BOOL)isPwd;

///View设置圆角
+ (void)viewSetBorderRadius:(UIView *)view border:(CGFloat)border;

///View变为圆形
+ (void)viewSetCircular:(UIView *)view;

/**
 *  给view设置边框
 *
 *  @param view        view
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *  @param border      边框圆角
 */
+ (void)viewAddBorder:(UIView *)view
          borderWidth:(CGFloat)borderWidth
          borderColor:(UIColor *)borderColor
               border:(CGFloat)border;

///获得当前显示的ViewController
+ (UIViewController *)getCurrentViewController;


///屏幕截图
+ (UIImage *)getScreenshots;
///合并图片
+ (UIImage *)mergerImage:(UIImage *)bigImage secodImage:(UIImage *)samilImage;

///根据宽度计算文字的高度
+(CGFloat)textheight:(NSString *)string andFont:(UIFont *)fontsize andwidth:(CGFloat)numsize;


///根据高度计算文字的宽度
+(CGFloat)textWidth:(NSString *)string andFont:(UIFont *)fontsize andHight:(CGFloat)numsize;

/**
 *  unicode 字符转转换
 *
 *  @param unicodeStr 例如:Unicode  \U1254
 *
 *  @return @"好"
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

/**
 *  给定时间获得时间戳
 *
 *  @param time 2011-12-23 12:12:34
 *
 *  @return 12323243432432
 */
+ (NSString *)timeStepWithStudioTime:(NSString *)time ;

/*!
 *  根据时间字符串 返回时间值 NSDate
 *
 *  @param dateString 2011-12-23 12:12:34
 *
 *  @return date
 */
+ (NSDate *)dateWithDateString:(NSString *)dateString;
@end

