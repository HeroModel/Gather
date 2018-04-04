//
//  UIColor+Random.h
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Random)
/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;
@end



#define  Hero_HexColor(hex)        [UIColor colorWithHexString:@#hex]
@interface UIColor (Hero_EXtension)
// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

