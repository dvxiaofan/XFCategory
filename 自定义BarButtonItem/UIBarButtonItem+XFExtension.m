//
//  UIBarButtonItem+XFExtension.m
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UIBarButtonItem+XFExtension.h"
#import <objc/runtime.h>


static char btnBlockKey;
static char itemBlockKey;

typedef void(^ActionBlock)();

@implementation UIBarButtonItem (XFExtension)

+ (instancetype)xf_itemWithImagename:(NSString *)imagename highImagename:(NSString *)highImagename target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imagename) {
        [button setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    }
    if (highImagename) {
        [button setImage:[UIImage imageNamed:highImagename] forState:UIControlStateHighlighted];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.frame = (CGRect){CGPointZero, button.currentImage.size};
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)xf_itemWithImagename:(NSString *)imagename highImagename:(NSString *)highImagename touchBlock:(void (^)())block {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imagename) {
        [button setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    }
    if (highImagename) {
        [button setImage:[UIImage imageNamed:highImagename] forState:UIControlStateHighlighted];
    }
    [button addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = (CGRect){CGPointZero, button.currentImage.size};
    objc_setAssociatedObject(button, &btnBlockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    [item setCustomView:button];
    return item;
}

+ (instancetype)xf_itemWithTitle:(NSString *)title tatget:(id)target action:(SEL)action tintColor:(UIColor *)tintColor {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    item.tintColor = tintColor;
    return item;
}

+ (instancetype)xf_itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor touchBlock:(void (^)())block {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(itemTouch:)];
    item.tintColor = tintColor;
    item.block = block;
    return item;
}

- (void)setBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &itemBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)block {
    return objc_getAssociatedObject(self, &itemBlockKey);
}

- (void)btnTouch:(UIButton *)button {
    ActionBlock block = objc_getAssociatedObject(button, &btnBlockKey);
    if (block) {
        block();
    }
}

+ (void)itemTouch:(UIBarButtonItem *)item {
    if (item.block) {
        item.block();
    }
}

@end















