//
//  EZStoryboardAction.m
//  bashiBus
//
//  Created by ye on 15/6/9.
//  Copyright (c) 2015年 4GInter. All rights reserved.
//

#import "EZStoryboardAction.h"
#import <objc/runtime.h>

@implementation EZStoryboardAction
- (void)setOwner:(id)owner
{
    if (_owner != owner) {
        [self releaseLifetimeFromObject:_owner];
        _owner = owner;
        [self bindLifetimeToObject:_owner];
    }
}

- (void)bindLifetimeToObject:(id)object
{
    objc_setAssociatedObject(object, (__bridge void *)self, self,   OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)releaseLifetimeFromObject:(id)object
{
    objc_setAssociatedObject(object, (__bridge void *)self, nil,    OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)backBtnPressed:(id)sender
{
    [_owner.navigationController popViewControllerAnimated:YES];
}

- (void)dismissBtnPressed:(id)sender
{
    [_owner.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
