//
//  UIBarButtonItem+XFExtension.m
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UIBarButtonItem+XFExtension.h"

@implementation UIBarButtonItem (XFExtension)

+ (instancetype)xf_itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

@end
