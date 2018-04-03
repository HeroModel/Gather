//
//  MBProgressShow.h
//  HoKol
//
//  Created by mac on 2017/7/16.
//  Copyright © 2017年 HoKol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBProgressShow : UIView
+ (void)ShowMBProgress:(NSString *)string WithTimer:(NSInteger)timers WithView:(UIView *)view;
+ (void)ShowMBProgressTimer:(NSInteger)timers WithView:(UIView *)view;
@end
