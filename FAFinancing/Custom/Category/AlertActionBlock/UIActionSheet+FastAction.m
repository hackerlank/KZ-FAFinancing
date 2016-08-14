//
//  UIActionSheet+FastAction.m
//  doctor
//
//  Created by Company on 15/11/19.
//  Copyright © 2015年 侯康柱. All rights reserved.
//

#import "UIActionSheet+FastAction.h"
#import <objc/runtime.h>
@implementation UIActionSheet (FastAction)

- (void)setActionBlock:(void (^)(UIActionSheet *, NSInteger))actionBlock {
    
    objc_setAssociatedObject(self, @selector(actionBlock), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (actionBlock == NULL) {
        self.delegate = nil;
    }
    else {
        self.delegate = self;
    }
    
}

- (void (^)(UIActionSheet *, NSInteger))actionBlock {
    return objc_getAssociatedObject(self, @selector(actionBlock));
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.actionBlock(actionSheet,buttonIndex);
}
@end
