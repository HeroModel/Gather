//
//  LabelAttributedStringViewController.m
//  Gather
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "LabelAttributedStringViewController.h"

@interface LabelAttributedStringViewController ()

@end

@implementation LabelAttributedStringViewController
- (BOOL)fd_prefersNavigationBarHidden
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    [self createLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 创建“导航栏”
- (void)createNav{
    // 在主线程异步加载，使下面的方法最后执行，防止其他的控件挡住了导航栏
//    dispatch_async(dispatch_get_main_queue(), ^{
        // 隐藏系统导航栏
        self.navigationController.navigationBar.hidden = YES;
        // 创建假的导航栏
        UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YW_SCREEN_WIDTH, YW_APPLICATION_TOP_BAR_HEIGHT)];
        [self.view addSubview:navView];
        // 创建导航栏的titleLabel
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 0,44 * WIDTHFIT)];
        titleLabel.text = _navTitle;
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(YW_SCREEN_WIDTH / 2 - titleLabel.frame.size.width / 2, 20, titleLabel.frame.size.width, 44);
        [navView addSubview:titleLabel];
        
        UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"nav-icon-Return" target:self action:@selector(didButtonPop:)];
        [navView addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10 * WIDTHFIT);
            make.top.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * WIDTHFIT));
        }];
//    });
}
- (void)didButtonPop:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)createLabel
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, YW_APPLICATION_TOP_BAR_HEIGHT + 20, YW_SCREEN_WIDTH - (40 * WIDTHFIT), 200 * WIDTHFIT)];
    [self.view addSubview:view];
    
     NSString *title = @"不得不说 YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用";
    YYLabel * label = [YYLabel new];
    label.displaysAsynchronously = YES;
    label.ignoreCommonProperties = YES;
    [view addSubview:label];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:title];
        text.yy_font = NAM_TITLE_B;
        text.yy_color = [UIColor grayColor];
        [text yy_setColor:[UIColor redColor] range:NSMakeRange(5, 10)];
        [text yy_setColor:[UIColor yellowColor] range:NSMakeRange(30, 5)];
//        [text yy_setTextHighlightRange:NSMakeRange(30, 5) color:[UIColor yellowColor] backgroundColor:[UIColor greenColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
//
//        }];
        YYTextContainer * container = [YYTextContainer new];
        container.size = CGSizeMake(YW_SCREEN_WIDTH - 40, CGFLOAT_MAX);
        container.maximumNumberOfRows = 0;
        
        YYTextLayout * layout = [YYTextLayout layoutWithContainer:container text:text];
        dispatch_async(dispatch_get_main_queue(), ^{
            label.frame = layout.textBoundingRect;
            label.textLayout = layout;
        });
    });

    
}

@end
