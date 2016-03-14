//
//  UISwitch+EZTools.m
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import "UISwitch+EZTools.h"
#import <objc/objc-runtime.h>

@implementation UISwitch (EZTools)

- (void)setChangeBlk:(UISwitchChangeBlock)changeBlk
{
    objc_setAssociatedObject(self, (__bridge void *)self, changeBlk,   OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!([self.allTargets containsObject:self] && [self actionsForTarget:self forControlEvent:UIControlEventValueChanged])) {
        [self addTarget:self action:@selector(valueChangedInternal:) forControlEvents:UIControlEventValueChanged];
    }
}

- (UISwitchChangeBlock)changeBlk
{
    return objc_getAssociatedObject(self, (__bridge void *)self);
}

- (void)valueChangedInternal:(id)sender
{
    if (self.changeBlk) {
        self.changeBlk(sender);
    }
}
@end
