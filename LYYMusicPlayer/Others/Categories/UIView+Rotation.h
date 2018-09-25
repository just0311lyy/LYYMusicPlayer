//
//  UIView+Rotation.h
//  LYYMusicPlayer
//
//  Created by apple on 16/2/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rotation)
//让当前视图顺时针不断旋转
- (void)rotate:(NSTimeInterval)duration;
//停止旋转动画
- (void)stopRotation;

@end
