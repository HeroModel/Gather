//
//  UIView+YwViewFrame.h
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YwViewFrame)
@property (nonatomic) CGFloat hero_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat hero_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat hero_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat hero_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat hero_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat hero_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat hero_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat hero_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint hero_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  hero_size;        ///< Shortcut for frame.size.
@end
