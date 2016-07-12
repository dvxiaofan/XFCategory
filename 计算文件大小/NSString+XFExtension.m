//
//  NSString+XFExtension.m
//  
//
//  Created by xiaofan
//  Copyright © 2016年 xiaofan. All rights reserved.
//


#import "NSString+XFExtension.h"

@implementation NSString (XFExtension)

- (unsigned long long)xf_fileSize {
    unsigned long long size = 0;
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    if (isDirectory) {
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            
            size += [manager attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    } else {
        size = [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    return size;
}

@end










