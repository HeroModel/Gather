//
//  UIButton+ButtonTool.h
//  ShareMan
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIButton (ButtonTool)

+ (instancetype)ButtonWithType:(UIButtonType)type
                    WithString:(NSString *)string
           WithBackgroundColor:(UIColor *)backgroundColor
                 WithTextColor:(UIColor *)textColor
                      WithFont:(UIFont *)font
                        target:(id)target
                        action:(SEL)action;

+ (instancetype)TextStringStlyWithType:(UIButtonType)type
                            WithString:(NSString *)string
                   WithBackgroundColor:(UIColor *)backgroundColor
                         WithTextColor:(UIColor *)textColor
                              WithFont:(UIFont *)font
                                target:(id)target
                                action:(SEL)action;

+ (instancetype)ImageButtonWithType:(UIButtonType)type
                         WithString:(NSString *)string
                             target:(id)target
                             action:(SEL)action;
@end
