//
//  UIButton+ButtonTool.m
//  ShareMan
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIButton+ButtonTool.h"
@implementation UIButton (ButtonTool)
+ (instancetype)ButtonWithType:(UIButtonType)type
                    WithString:(NSString *)string
           WithBackgroundColor:(UIColor *)backgroundColor
                 WithTextColor:(UIColor *)textColor
                      WithFont:(UIFont *)font
                        target:(id)target
                        action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = backgroundColor;
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTintColor:YWColorFromRGB(WHITE_COLOR)];
    button.titleLabel.font = font;
    button.adjustsImageWhenDisabled = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (instancetype)TextStringStlyWithType:(UIButtonType)type
                            WithString:(NSString *)string
                   WithBackgroundColor:(UIColor *)backgroundColor
                         WithTextColor:(UIColor *)textColor
                              WithFont:(UIFont *)font
                                target:(id)target
                                action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = backgroundColor;
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTintColor:YWColorFromRGB(WHITE_COLOR)];
    button.titleLabel.font = font;
    button.adjustsImageWhenDisabled = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (instancetype)ImageButtonWithType:(UIButtonType)type
                         WithString:(NSString *)string
                             target:(id)target
                             action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = YWColorFromRGB(WHITE_COLOR);
    [button setImage:[[UIImage imageNamed:string] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setTintColor:YWColorFromRGB(WHITE_COLOR)];
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
