//
//  LabelAttributedStringViewController.m
//  Gather
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "LabelAttributedStringViewController.h"





#define String @"不得不说 YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用"
@interface LabelAttributedStringViewController ()<UITextViewDelegate>

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
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, YW_APPLICATION_TOP_BAR_HEIGHT + 20, YW_SCREEN_WIDTH - (40 * WIDTHFIT), 100 * WIDTHFIT)];
    [self.view addSubview:view];
    
     NSString *title = String;
    
//    /*
//     *
//     *  异步排版和渲染
//     *
//     */
    YYLabel * label = [YYLabel new];
    //如果需要获得最高的性能，你可以在后台线程用`YYTextLayout`进行预排版
    label.displaysAsynchronously = YES; //开启异步绘制
    label.ignoreCommonProperties = YES; //忽略除了textLayout之外的其他属性
    [view addSubview:label];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //创建属性字符串
        NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:title];
        text.yy_font = NAM_TITLE_B;
        text.yy_color = [UIColor grayColor];
        [text yy_setColor:[UIColor redColor] range:NSMakeRange(5, 10)];
        [text yy_setColor:[UIColor yellowColor] range:NSMakeRange(30, 5)];
        //1.创建一个“高亮”属性，当用户点击了高亮区域的文本时，“高亮”属性会替换掉原本的属性
        YYTextBorder * border = [YYTextBorder borderWithFillColor:[UIColor grayColor] cornerRadius:3];
        YYTextHighlight * highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor blueColor]];
        [highlight setBackgroundBorder:border];
        // 2.将“高亮”属性设置到某个文本范围中
        
        [text yy_setTextHighlight:highlight range:NSMakeRange(5, 10)];
        // 3.将属性文本设置到YYLabel或YYTextView
        // 4.接受事件回调
        label.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [MBProgressShow ShowMBProgress:@"1" WithTimer:1 WithView:YWSharedAppDelegate];
        };
        label.highlightLongPressAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [MBProgressShow ShowMBProgress:@"2" WithTimer:1 WithView:YWSharedAppDelegate];
            
        };
        
        //高亮显示
//        [text yy_setTextHighlightRange:NSMakeRange(30, 5) color:[UIColor yellowColor] backgroundColor:[UIColor greenColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
//
//        }];
        //创建文本容器
        YYTextContainer * container = [YYTextContainer new];
        container.size = CGSizeMake(YW_SCREEN_WIDTH - 40, CGFLOAT_MAX);
        container.maximumNumberOfRows = 0;
        //生成排版结果
        YYTextLayout * layout = [YYTextLayout layoutWithContainer:container text:text];
        dispatch_async(dispatch_get_main_queue(), ^{
            label.frame = layout.textBoundingRect;
            label.textLayout = layout;
        });
    });
}
#pragma mark --- YYTextViewDelegate （点击textView高亮处进行跳转）
- (void)textView:(YYTextView *)textView didTapHighlight:(nonnull YYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect
{
    [MBProgressShow ShowMBProgress:@"1" WithTimer:1 WithView:YWSharedAppDelegate];
}
- (void)textView:(YYTextView *)textView didLongPressHighlight:(nonnull YYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect
{
    [MBProgressShow ShowMBProgress:@"2" WithTimer:1 WithView:YWSharedAppDelegate];
}
@end
