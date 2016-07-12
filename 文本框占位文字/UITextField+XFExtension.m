//
//  UITextField+XFExtension.m
//
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UITextField+XFExtension.h"

static NSString * const XFPlaceholderColorKey = @"_placeholderLabel.textColor";

@implementation UITextField (XFExtension)

- (void)setXf_placeholderColor:(UIColor *)xf_placeholderColor {
    
    // 先设置占位文字，可以提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (xf_placeholderColor == nil) {
        xf_placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:xf_placeholderColor forKeyPath:XFPlaceholderColorKey];
    
}

- (UIColor *)xf_placeholderColor
{
    return [self valueForKeyPath:XFPlaceholderColorKey];
}

@end


















