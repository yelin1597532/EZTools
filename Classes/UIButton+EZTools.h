//
//  UIButton+EZTools.h
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIButtonClickBlock)(id sender);

@interface UIButton (EZTools)
@property (nonatomic, copy) UIButtonClickBlock clickBlk;
@end
