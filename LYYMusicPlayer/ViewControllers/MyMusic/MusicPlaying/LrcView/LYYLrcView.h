//
//  LYYLrcView.h
//  LYYMusicPlayer
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYYLrcView : UIView
//歌词文件的文件名
@property (strong, nonatomic)NSString *lrcName;
//当前正在播放的时间点
@property (assign, nonatomic)NSTimeInterval currentTime;
@end
