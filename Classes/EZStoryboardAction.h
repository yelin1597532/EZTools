//
//  EZStoryboardAction.h
//  bashiBus
//
//  Created by ye on 15/6/9.
//  Copyright (c) 2015年 4GInter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZStoryboardAction : NSObject
@property (nonatomic, weak) IBOutlet UIViewController *owner;
- (IBAction)backBtnPressed:(id)sender;
- (IBAction)dismissBtnPressed:(id)sender;
@end
