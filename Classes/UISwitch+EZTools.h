//
//  UISwitch+EZTools.h
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UISwitchChangeBlock)(id sender);

@interface UISwitch (EZTools)
@property (nonatomic, copy) UISwitchChangeBlock changeBlk;
@end
