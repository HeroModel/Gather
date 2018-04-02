//
//  UIBarButtonItem+YWExtension.m
//  ShareMan
//
//  Created by apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIBarButtonItem+YWExtension.h"

@implementation UIBarButtonItem (YWExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 50 * WIDTHFIT, 50 * HEIGHTFIT);
        [button setBackgroundImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [button setBackgroundImage:[[UIImage imageNamed:highImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
        
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        return [[self alloc] initWithCustomView:button];
        
    }
}

@end
