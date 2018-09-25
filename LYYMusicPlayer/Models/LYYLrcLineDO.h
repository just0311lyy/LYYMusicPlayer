//
//  LYYLrcLineDO.h
//  LYYMusicPlayer
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 *  歌词的行类，一个此类对象代表一行歌词
 */

#import <Foundation/Foundation.h>

@interface LYYLrcLineDO : NSObject
@property(strong, nonatomic)NSString *words;//内容
@property(strong, nonatomic)NSString *time;//播放时间
@end
