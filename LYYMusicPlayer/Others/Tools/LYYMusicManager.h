//
//  LYYMusicManager.h
//  LYYMusicPlayer
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYYMusic.h"
@interface LYYMusicManager : NSObject
//返回所有要播放的音乐
+ (NSArray *)musics;
//返回正在播放的音乐
+ (LYYMusic *)playingMusic;
//设置当前需要播放的音乐
+ (void)setPlayingMusic:(LYYMusic *)playingMusic;
//返回上一首歌曲
+ (LYYMusic *)previousMusic;
//返回下一首歌曲
+ (LYYMusic *)nextMusic;

+ (NSArray *)musicsFromPlist:(NSString *)plist;

@end
