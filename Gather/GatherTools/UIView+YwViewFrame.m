//
//  UIView+YwViewFrame.m
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIView+YwViewFrame.h"

@implementation UIView (YwViewFrame)
- (CGFloat)hero_x {
    return self.frame.origin.x;
}
- (void)setHero_x:(CGFloat)hero_x {
    CGRect frame = self.frame;
    frame.origin.x = hero_x;
    self.frame = frame;
}
- (CGFloat)hero_y {
    return self.frame.origin.y;
}
- (void)setHero_y:(CGFloat)hero_y {
    CGRect frame = self.frame;
    frame.origin.y = hero_y;
    self.frame = frame;
}
- (CGFloat)hero_right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setHero_right:(CGFloat)hero_right {
    CGRect frame = self.frame;
    frame.origin.x = hero_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)hero_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setHero_bottom:(CGFloat)hero_bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = hero_bottom - frame.size.height;
    
    self.frame = frame;
}
- (CGFloat)hero_width {
    return self.frame.size.width;
}

- (void)setHero_width:(CGFloat)hero_width {
    CGRect frame = self.frame;
    frame.size.width = hero_width;
    self.frame = frame;
}
- (CGFloat)hero_height {
    return self.frame.size.height;
}

- (void)setHero_height:(CGFloat)hero_height {
    CGRect frame = self.frame;
    frame.size.height = hero_height;
    self.frame = frame;
}
- (CGFloat)hero_centerX {
    return self.center.x;
}

- (void)setHero_centerX:(CGFloat)hero_centerX {
    self.center = CGPointMake(hero_centerX, self.center.y);
}

- (CGFloat)hero_centerY {
    return self.center.y;
}

- (void)setHero_centerY:(CGFloat)hero_centerY {
    self.center = CGPointMake(self.center.x, hero_centerY);
}

- (CGPoint)hero_origin {
    return self.frame.origin;
}

- (void)setHero_origin:(CGPoint)hero_origin {
    CGRect frame = self.frame;
    frame.origin = hero_origin;
    self.frame = frame;
}

- (CGSize)hero_size {
    return self.frame.size;
}

- (void)setHero_size:(CGSize)hero_size {
    CGRect frame = self.frame;
    frame.size = hero_size;
    self.frame = frame;
}

@end
