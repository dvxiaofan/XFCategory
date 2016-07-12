//
//  UIView+XFExtension.h
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XFExtension)
@property (nonatomic, assign) CGFloat xf_width;
@property (nonatomic, assign) CGFloat xf_height;
@property (nonatomic, assign) CGFloat xf_x;
@property (nonatomic, assign) CGFloat xf_y;
@property (nonatomic, assign) CGFloat xf_centerX;
@property (nonatomic, assign) CGFloat xf_centerY;

@property (nonatomic, assign) CGFloat xf_right;
@property (nonatomic, assign) CGFloat xf_bottom;

/**
 *  从 nib 创建 view
 */
+ (instancetype)xf_viewFromXib;

/**
 *  判断两个 view 是否有重叠
 */
- (BOOL)xf_intersectWithView:(UIView *)view;

@end
