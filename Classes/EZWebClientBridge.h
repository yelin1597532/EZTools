//
//  EZWebClientBridge.h
//  bashiBus
//  解析url并执行响应方法
//  Created by ye on 15/4/27.
//  Copyright (c) 2015年 4GInter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZWebClientBridge : NSObject

//是否客户端是否能响应url(url方法是否是BaShiGo)
+ (BOOL)canHandleUrl:(NSURL *)url withScheme:(NSString *)scheme;


/*
    解析url，并让target执行响应方法
    比如url为@"BaShiGo://method?paramOne=123&paramTwo=321"
    将会以 [target method:param] 形式调用target的 method:方法
    参数为 @{@"paramOne":@"123", @"paramTwo":@"321"}形式的字典
 */
+ (BOOL)handleUrl:(NSURL *)url withScheme:(NSString *)scheme withTarget:(id)target;

@end
