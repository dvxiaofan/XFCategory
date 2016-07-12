//
//  UIImageView+XFExtension.m
//
//  Created by xiaofan on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UIImageView+XFExtension.h"
#import "UIImage+XFExtension.h"

@implementation UIImageView (XFExtension)

/**
 *  圆形
 */
- (void)xf_setCircleHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    // 让占位图片也是圆的
    UIImage *placeholderImage = [UIImage xf_circleImage:placeholderName];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        self.image = [image xf_circleImage];
    }];
}

/**
 *  方形,也可以设置圆角
 */
- (void)xf_setRectHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        self.layer.cornerRadius = 8.0;
        self.clipsToBounds = YES;
    }];
}

/**
 *  六边形
 */
- (void)xf_setSixSideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        // 这个宽高要跟外面你要设置的 imageview 的宽高一样
        CGFloat imageViewWH = 57;
        
        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = 2;
        [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake((imageViewWH / 2), 0)];
        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 2) + (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake((imageViewWH / 2), imageViewWH)];
        [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 2) + (imageViewWH / 4))];
        [path closePath];
        CAShapeLayer * shapLayer = [CAShapeLayer layer];
        shapLayer.lineWidth = 2;
        shapLayer.path = path.CGPath;
        self.layer.mask = shapLayer;
    }];
}

@end
