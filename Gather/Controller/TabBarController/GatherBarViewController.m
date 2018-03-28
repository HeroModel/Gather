//
//  GatherBarViewController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GatherBarViewController.h"
#import "BasisTableViewController.h"
#import "FristTableViewController.h"
#import "SecondTableViewController.h"
#import "ThirdTableViewController.h"
#import "FourthTableViewController.h"


@interface GatherBarViewController ()

@end

@implementation GatherBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addControllers];
}
- (void)addControllers
{
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:[[BasisTableViewController alloc] init]];
    nav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:9000];
    
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:[[FristTableViewController alloc] init]];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:9001];
    
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:[[SecondTableViewController alloc] init]];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:9002];
    
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:[[ThirdTableViewController alloc] init]];
    nav3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:9003];
    
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:[[FourthTableViewController alloc] init]];
    nav4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:9004];
    self.viewControllers = @[nav, nav1, nav2, nav3, nav4];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
