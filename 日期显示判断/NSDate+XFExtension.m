//
//  NSDate+XFExtension.m
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "NSDate+XFExtension.h"
#import "NSCalendar+XFExtension.h"

@implementation NSDate (XFExtension)

/**
 *  判断 self 这个日期是否是今年
 */
- (BOOL)isThisYear {
    
    NSCalendar *calendar = [NSCalendar xf_calendar];
    
    // 判断年
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return selfYear == nowYear;
}

/**
 *  今天
 */
- (BOOL)isToday {
    
    NSCalendar *calendar = [NSCalendar xf_calendar];
    
    // 判断天
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return selfCmps.year == nowCmps.year && selfCmps.month == nowCmps.month && selfCmps.day == nowCmps.day;
}

/**
 *  昨天
 */
- (BOOL)isYesterday {
    
    NSDateFormatter *fmt= [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar xf_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comps.year == 0 && comps.month == 0 && comps.day == 1;
}

/**
 *  明天
 */
- (BOOL)isTomorrow {
	
    NSDateFormatter *fmt= [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar xf_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comps.year == 0 && comps.month == 0 && comps.day == -1; // -1
}






@end
