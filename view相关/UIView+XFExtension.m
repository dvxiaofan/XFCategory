//
//  UIView+XFExtension.m
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UIView+XFExtension.h"

@implementation UIView (XFExtension)
- (CGFloat)xf_width
{
    return self.frame.size.width;
}

- (CGFloat)xf_height
{
    return self.frame.size.height;
}

- (void)setXf_width:(CGFloat)xf_width
{
    CGRect frame = self.frame;
    frame.size.width = xf_width;
    self.frame = frame;
}

- (void)setXf_height:(CGFloat)xf_height
{
    CGRect frame = self.frame;
    frame.size.height = xf_height;
    self.frame = frame;
}

- (CGFloat)xf_x
{
    return self.frame.origin.x;
}

- (void)setXf_x:(CGFloat)xf_x
{
    CGRect frame = self.frame;
    frame.origin.x = xf_x;
    self.frame = frame;
}

- (CGFloat)xf_y
{
    return self.frame.origin.y;
}

- (void)setXf_y:(CGFloat)xf_y
{
    CGRect frame = self.frame;
    frame.origin.y = xf_y;
    self.frame = frame;
}

- (CGFloat)xf_centerX
{
    return self.center.x;
}

- (void)setXf_centerX:(CGFloat)xf_centerX
{
    CGPoint center = self.center;
    center.x = xf_centerX;
    self.center = center;
}

- (CGFloat)xf_centerY
{
    return self.center.y;
}

- (void)setXf_centerY:(CGFloat)xf_centerY
{
    CGPoint center = self.center;
    center.y = xf_centerY;
    self.center = center;
}

- (CGFloat)xf_right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)xf_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setXf_right:(CGFloat)xf_right
{
    self.xf_x = xf_right - self.xf_width;
}

- (void)setXf_bottom:(CGFloat)xf_bottom
{
    self.xf_y = xf_bottom - self.xf_height;
}

+ (instancetype)xf_viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self)
                                         owner:nil
                                       options:nil].lastObject;
}

- (BOOL)xf_intersectWithView:(UIView *)view {
    CGRect selfRect = [self convertRect:self.bounds toView:nil];
    CGRect viewRect = [view convertRect:view.bounds toView:nil];
    
    return CGRectIntersectsRect(selfRect, viewRect);
}

@end







