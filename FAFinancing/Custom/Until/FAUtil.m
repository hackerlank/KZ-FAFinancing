//
//  FAUtil.h
//
//
//  Created by HouKangzhu on 15/5/7.
//  Copyright (c) 2015年 侯康柱 All rights reserved.
//

#import "FAUtil.h"
#import <Accelerate/Accelerate.h>
@implementation FAUtil

+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (title) {
        label.text = title;
    }
    if (font) {
        label.font = font;
    }
    return label;
}

+ (UIImageView *)createImageView:(CGRect)frame imageName:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}

+ (UIButton *)createBtnFrame:(CGRect)frame
                      image:(NSString *)image
                selectImage:(NSString *)selectImageName
                     target:(id)target
                     action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (image) {
        [btn setImage:[UIImage imageNamed:image]forState:UIControlStateNormal];
    }
    if (selectImageName) {
        [btn setImage:[UIImage imageNamed:selectImageName]forState:UIControlStateSelected];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

+ (UITextField *)createTextFieldFrame:(CGRect)frame placeHolder:(NSString *)placeHolder isPwd:(BOOL)isPwd {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    if (placeHolder) {
        textField.placeholder = placeHolder;
    }
    if (isPwd) {
        textField.secureTextEntry = YES;
    }
    return textField;
}

///View设置圆角
+ (void)viewSetBorderRadius:(UIView *)view border:(CGFloat)border {
    [view layoutIfNeeded];
    view.layer.cornerRadius = border;
    view.clipsToBounds = YES;
}

///View变为圆形
+ (void)viewSetCircular:(UIView *)view {
    [view layoutIfNeeded];
    view.layer.cornerRadius = CGRectGetHeight(view.frame)/2;
    view.clipsToBounds = YES;
}

///设置边框,圆角
+ (void)viewAddBorder:(UIView *)view
          borderWidth:(CGFloat)borderWidth
          borderColor:(UIColor *)borderColor
               border:(CGFloat)border {
    [self viewSetBorderRadius:view border:border];
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor.CGColor;
}

///当前显示的VC
+ (UIViewController *)getCurrentViewController {
    UITabBarController * tabbarCtrl = (UITabBarController *)((UIWindow *)[UIApplication sharedApplication].windows[0]).rootViewController;
    UINavigationController *nav = tabbarCtrl.selectedViewController;
    UIViewController *vc = [[nav viewControllers] lastObject];
    return vc;
}

+ (UIImage *)getScreenshots {
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    ///保存到相册
//    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    return viewImage;
}


//合并图片
+ (UIImage *)mergerImage:(UIImage *)bigImage secodImage:(UIImage *)samilImage {
    CGSize imageSize = bigImage.size;
    UIGraphicsBeginImageContext(imageSize);
    [bigImage drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    [samilImage drawInRect:CGRectMake(0, 0, samilImage.size.width, samilImage.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

///根据宽度计算文字的高度
+(CGFloat)textheight:(NSString *)string andFont:(UIFont *)fontsize andwidth:(CGFloat)numsize {
    NSString *text = string;
    UIFont *font = fontsize;//跟label的字体大小一样
    CGSize size = CGSizeMake(numsize, MAXFLOAT);//跟label的宽设置一样
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}

///根据高度计算文字的宽度
+(CGFloat)textWidth:(NSString *)string andFont:(UIFont *)fontsize andHight:(CGFloat)numsize {
    NSString *text = string;
    UIFont *font = fontsize;//跟label的字体大小一样
    CGSize size = CGSizeMake(MAXFLOAT, numsize);//跟label的宽设置一样
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.width;
}

+ (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    if ([tempStr1 rangeOfString:@"\\U"].length < 1) {
        return unicodeStr;
    }
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

+ (NSString *)timeStepWithStudioTime:(NSString *)time {
    NSDate *resultDate = [self dateWithDateString:time];
    return [NSString stringWithFormat:@"%f", [resultDate timeIntervalSince1970]*1000];
}


+ (NSDate *)dateWithDateString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *resultDate = [formatter dateFromString:dateString];
    return resultDate;
}
@end


