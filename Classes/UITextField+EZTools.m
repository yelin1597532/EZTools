//
//  UITextField+EZTools.m
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import "UITextField+EZTools.h"
#import <objc/objc-runtime.h>

NSString *textChange = @"textChange";
NSString *editingBegin = @"editingBegin";
NSString *editingEnd = @"editingEnd";

@implementation UITextField (EZTools)
- (void)setTextChangeBlk:(UITextFieldTextChangeBlock)textChangeBlk
{
    objc_setAssociatedObject(self, &textChange, textChangeBlk,   OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!([self.allTargets containsObject:self] && [self actionsForTarget:self forControlEvent:UIControlEventEditingChanged])) {
        [self addTarget:self action:@selector(textChangedInternal:) forControlEvents:UIControlEventEditingChanged];
    }
}

- (UITextFieldTextChangeBlock)textChangeBlk
{
    return objc_getAssociatedObject(self, &textChange);
}

- (void)textChangedInternal:(id)sender
{
    if (self.textChangeBlk) {
        self.textChangeBlk(self.text);
    }
}

- (void)setEditingBeginBlk:(UITextFieldEditingChangeBlock)editingBeginBlk
{
    objc_setAssociatedObject(self, &editingBegin, editingBeginBlk,   OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!([self.allTargets containsObject:self] && [self actionsForTarget:self forControlEvent:UIControlEventEditingDidBegin])) {
        [self addTarget:self action:@selector(editingBeginInternal:) forControlEvents:UIControlEventEditingDidBegin];
    }
}

- (UITextFieldEditingChangeBlock)editingBeginBlk
{
    return objc_getAssociatedObject(self, &editingBegin);
}

- (void)editingBeginInternal:(id)sender
{
    if (self.editingBeginBlk) {
        self.editingBeginBlk();
    }
}

- (void)setEditingEndBlk:(UITextFieldEditingChangeBlock)editingEndBlk
{
    objc_setAssociatedObject(self, &editingEnd, editingEndBlk,   OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!([self.allTargets containsObject:self] && [self actionsForTarget:self forControlEvent:UIControlEventEditingDidEnd])) {
        [self addTarget:self action:@selector(editingEndInternal:) forControlEvents:UIControlEventEditingDidEnd];
    }
}

- (UITextFieldEditingChangeBlock)editingEndBlk
{
    return objc_getAssociatedObject(self, &editingEnd);
}

- (void)editingEndInternal:(id)sender
{
    if (self.editingEndBlk) {
        self.editingEndBlk();
    }
}
@end
