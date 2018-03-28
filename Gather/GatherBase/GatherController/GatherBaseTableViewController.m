//
//  GatherBaseTableViewController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GatherBaseTableViewController.h"

@interface GatherBaseTableViewController ()

@end

@implementation GatherBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
#ifdef __IPHONE_11_0
    if ([self.tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.tableView.estimatedRowHeight = 0;
            self.tableView.estimatedSectionHeaderHeight = 0;
            self.tableView.estimatedSectionFooterHeight = 0;
        } else {
            
            
        }
    }
#endif
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //当收到内存警告时,移除当前没有在屏幕上显示的视图.
    
    //判断是否可以安全的移除视图控制器的view.
    
    //判断当前的视图控制器的view是否是屏幕上显示.self.view.window
    
    //判断当前视图控制器的view是否已经成功加载.isViewLoaded
    
    if( self.view.window == nil && [self isViewLoaded]) {
        //安全移除控制器的view;
        self.view = nil;
        
    }
}

@end
