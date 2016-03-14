//
//  ViewController.m
//  EZTools
//
//  Created by ye on 16/3/14.
//  Copyright © 2016年 4GInter. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EZTools.h"
#import "UISwitch+EZTools.h"
#import "UITextField+EZTools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UISwitch *onoff;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ViewController *weakSelf = self;
    _btn.clickBlk = ^(UIButton *btn){
        [weakSelf.textField resignFirstResponder];
        NSLog(@"button clicked");
    };
    _onoff.changeBlk = ^(UISwitch *onoff){
        NSLog(@"switch changed:%@",onoff.on?@"YES":@"NO");
    };
    _textField.textChangeBlk = ^(NSString *text){
        NSLog(@"text changed: %@",text);
    };
    _textField.editingBeginBlk = ^{
        NSLog(@"editing begin");
    };
    _textField.editingEndBlk = ^{
        NSLog(@"editing end");
    };}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
