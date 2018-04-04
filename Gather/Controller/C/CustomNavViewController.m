//
//  CustomNavViewController.m
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CustomNavViewController.h"

@interface CustomNavViewController ()

@end

@implementation CustomNavViewController
- (BOOL)fd_interactivePopDisabled
{
    return YES;
}
- (BOOL)fd_prefersNavigationBarHidden
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self createNav];
}
//创建“导航栏”
- (void)createNav{
    // 在主线程异步加载，使下面的方法最后执行，防止其他的控件挡住了导航栏
        dispatch_async(dispatch_get_main_queue(), ^{
    // 隐藏系统导航栏
    self.navigationController.navigationBar.hidden = YES;
    // 创建假的导航栏
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YW_SCREEN_WIDTH, YW_APPLICATION_TOP_BAR_HEIGHT)];
            navView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:navView];
    // 创建导航栏的titleLabel
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 0,44 * WIDTHFIT)];
    titleLabel.text = @"自定义导航栏";
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(YW_SCREEN_WIDTH / 2 - titleLabel.frame.size.width / 2, 20, titleLabel.frame.size.width, 44);
    [navView addSubview:titleLabel];
    
    UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"nav-icon-Return" target:self action:@selector(didButtonPop:)];
    [navView addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10 * WIDTHFIT);
        make.bottom.equalTo(navView.bottom);
        make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * WIDTHFIT));
    }];
        });
}
- (void)didButtonPop:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
