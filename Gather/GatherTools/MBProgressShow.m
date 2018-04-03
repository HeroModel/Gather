//
//  MBProgressShow.m
//  HoKol
//
//  Created by mac on 2017/7/16.
//  Copyright © 2017年 HoKol. All rights reserved.
//

#import "MBProgressShow.h"

@implementation MBProgressShow

+ (void)ShowMBProgress:(NSString *)string WithTimer:(NSInteger)timers WithView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view  animated:YES];
    hud.mode = MBProgressHUDModeText;
    if ([string length] >= 8) {
        hud.detailsLabel.text = string;
        hud.detailsLabel.font = NAM_TITLE_B;
        hud.color = [UIColor blackColor];
        hud.contentColor = [UIColor whiteColor];
        
    }else{
        
        hud.label.text = string;
        hud.label.numberOfLines = 0;
        hud.label.font = NAM_TITLE_B;
        hud.color = [UIColor blackColor];
        hud.contentColor = [UIColor whiteColor];
    }
    [hud hideAnimated:YES afterDelay:timers];
}
+ (void)ShowMBProgressTimer:(NSInteger)timers WithView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view  animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [hud hideAnimated:YES afterDelay:timers];
}
@end
