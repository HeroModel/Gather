//
//  GatherBaseTabBarController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GatherBaseTabBarController.h"

@interface GatherBaseTabBarController ()

@end

@implementation GatherBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName: [UIColor redColor],
                                                        NSFontAttributeName: [UIFont systemFontOfSize:15.f]
                                                        } forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
