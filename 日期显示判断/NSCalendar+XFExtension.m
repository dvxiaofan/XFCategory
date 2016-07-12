//
//  NSCalendar+XFExtension.m
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//


#import "NSCalendar+XFExtension.h"

@implementation NSCalendar (XFExtension)

+ (instancetype)xf_calendar {
    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}

@end
