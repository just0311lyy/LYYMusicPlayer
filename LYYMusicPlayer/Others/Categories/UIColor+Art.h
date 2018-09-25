//
//  UIColor+Art.h
//  LYYMusicPlayer
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Art)


+ (UIColor *) colorWith256Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;
+ (UIColor *) colorWithHex:(long)hex;
+ (UIColor *) colorWithHex:(long)hex andAlpha:(float)alpha;

@end
