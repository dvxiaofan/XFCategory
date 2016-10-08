//
//  UIBarButtonItem+XFExtension.h
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XFExtension)

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的图片 附带一个方法
 */
+ (instancetype)xf_itemWithImagename:(NSString *)imagename highImagename:(NSString *)highImagename target:(id)target action:(SEL)action;

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的图片 block 回调
 */
+ (instancetype)xf_itemWithImagename:(NSString *)imagename highImagename:(NSString *)highImagename touchBlock:(void(^)())block;

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的标题和 tintclolr 附带一个方法
 */
+ (instancetype)xf_itemWithTitle:(NSString *)title tatget:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的标题和 tintclolr 附带block 回调
 */
+ (instancetype)xf_itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor touchBlock:(void(^)())block;

@end








