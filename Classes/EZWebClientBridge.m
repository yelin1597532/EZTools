//
//  EZWebClientBridge.m
//  bashiBus
//
//  Created by ye on 15/4/27.
//  Copyright (c) 2015年 4GInter. All rights reserved.
//

#import "EZWebClientBridge.h"

@implementation EZWebClientBridge

+ (BOOL)canHandleUrl:(NSURL *)url withScheme:(NSString *)scheme
{
    return [url.scheme.lowercaseString isEqualToString:scheme];
}

+ (BOOL)handleUrl:(NSURL *)url withScheme:(NSString *)scheme withTarget:(id)target
{
    if ([self canHandleUrl:url withScheme:scheme]) {
        //生成selector
        NSString *selectorName = url.host;
        selectorName = [selectorName stringByAppendingString:@":"];
        SEL selector = NSSelectorFromString(selectorName);
        //生成参数
        NSString *query = url.query;
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSArray *paramStrs = [query componentsSeparatedByString:@"&"];
        for (NSString *paramStr in paramStrs) {
            NSArray *array = [paramStr componentsSeparatedByString:@"="];
            if (array.count >= 2) {
                id obj = array[1];
                if ([obj isKindOfClass:[NSString class]]) {
                    obj = [(NSString *)obj stringByRemovingPercentEncoding];
                }
                [dict setObject:obj forKey:array[0]];
            }
        }
        NSDictionary *paramDict = [NSDictionary dictionaryWithDictionary:dict];
        //调用方法
        if (target && [target respondsToSelector:selector]) {
            [target performSelector:selector withObject:paramDict];
            return YES;
        }
        return NO;
    } else {
        return NO;
    }
}

@end
