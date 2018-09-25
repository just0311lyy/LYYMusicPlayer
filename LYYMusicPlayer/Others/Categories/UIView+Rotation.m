//
//  UIView+Rotation.m
//  LYYMusicPlayer
//
//  Created by apple on 16/2/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIView+Rotation.h"

@implementation UIView (Rotation)

-(void)rotate:(NSTimeInterval)duration{
    
    // transform.rotation.z = 平面圖的旋轉
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = duration;
    rotationAnimation.repeatCount = 99999999999;  //默认为0，指动画会播放多少次
    rotationAnimation.removedOnCompletion = NO;
    // kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态
    rotationAnimation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:rotationAnimation forKey:@"UIViewRotation"];
    
}
-(void)stopRotation{
    
    [self.layer removeAnimationForKey:@"UIViewRotation"];
    
}


@end
