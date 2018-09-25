//
//  LYYMusicPlayer.h
//  LYYMusicPlayer
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface LYYMusicPlayer : NSObject

/**
 * 播放音乐
 * @param filename 音乐文件名
 * @return 播放是否成功
 */
+ (AVAudioPlayer *)playMusic:(NSString *)filename;

/**
 * 暂停播放
 * @param filename 音乐文件名
 */
+ (void)pauseMusic:(NSString *)filename;

/**
 * 停止播放
 * @param filename 音乐文件名
 */
+ (void)stopMusic:(NSString *)filename;


@end
