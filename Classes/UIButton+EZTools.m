//
//  UIButton+EZTools.m
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import "UIButton+EZTools.h"
#import <objc/objc-runtime.h>

@implementation UIButton (EZTools)

- (void)setClickBlk:(UIButtonClickBlock)clickBlk
{
    objc_setAssociatedObject(self, (__bridge void *)self, clickBlk,   OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (![self.allTargets containsObject:self]) {
        [self addTarget:self action:@selector(buttonClickedInternal:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIButtonClickBlock)clickBlk
{
    return objc_getAssociatedObject(self, (__bridge void *)self);
}

- (void)buttonClickedInternal:(id)sender
{
    if (self.clickBlk) {
        self.clickBlk(sender);
    }
}


@end
