//
//  UIImage+XFExtension.h
//
//  Created by xiaofan on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XFExtension)

/**
 *  返回圆形图片
 */
- (instancetype)xf_circleImage;

+ (instancetype)xf_circleImage:(NSString *)name;

@end
