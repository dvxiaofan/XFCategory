//
//  NSDate+XFExtension.h
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (XFExtension)

/**
 *  判断时间是否为今年
 */
- (BOOL)isThisYear;

/**
 *  判断是否是今天
 */
- (BOOL)isToday;

/**
 *  判断是否是昨天
 */
- (BOOL)isYesterday;

/**
 *  是否为明天
 */
- (BOOL)isTomorrow;




@end
