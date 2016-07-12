//
//  UIImageView+XFExtension.h
//
//  Created by xiaofan on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XFExtension)

- (void)xf_setCircleHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

- (void)xf_setRectHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

- (void)xf_setSixSideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

@end
