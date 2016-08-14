//
//  UIActionSheet+FastAction.h
//  doctor
//
//  Created by Company on 15/11/19.
//  Copyright © 2015年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (FastAction)<UIActionSheetDelegate>


@property (nonatomic)void (^actionBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@end
