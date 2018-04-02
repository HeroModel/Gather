//
//  UIBarButtonItem+YWExtension.h
//  ShareMan
//
//  Created by apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YWExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
