//
//  NSString+Time.m
//  LYYMusicPlayer
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+ (NSString *) stringWithMinuteAndSecondTime:(NSTimeInterval) timeInterval
{
    return [NSString stringWithFormat:@"%02d:%02d",(int)timeInterval / 60,(int)timeInterval % 60];
}

@end
