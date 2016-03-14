//
//  UITextField+EZTools.h
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UITextFieldTextChangeBlock)(NSString *text);
typedef void(^UITextFieldEditingChangeBlock)(void);

@interface UITextField (EZTools)
@property (nonatomic, copy) UITextFieldTextChangeBlock textChangeBlk;
@property (nonatomic, copy) UITextFieldEditingChangeBlock editingBeginBlk;
@property (nonatomic, copy) UITextFieldEditingChangeBlock editingEndBlk;
@end
