//
//  UIBarButtonItem+XFExtension.h
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XFExtension)

+ (instancetype)xf_itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
