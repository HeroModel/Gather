//
//  ShowNavViewController.m
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ShowNavViewController.h"

@interface ShowNavViewController ()

@end

@implementation ShowNavViewController
- (BOOL)fd_interactivePopDisabled
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"父类导航";
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
