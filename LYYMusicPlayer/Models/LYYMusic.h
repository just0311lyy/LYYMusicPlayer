//
//  LYYMusic.h
//  LYYMusicPlayer
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYYMusic : NSObject

@property (nonatomic, copy) NSString * musicName; //歌名
@property (nonatomic, copy) NSString * album; //专辑
@property (nonatomic, copy) NSString * artist; //歌手
@property (nonatomic, copy) NSString * musicIcon; //音乐图
@property (nonatomic, copy) NSString * singerIcon; //歌手图

@property (nonatomic, copy) NSString * fileName; //音乐文件
@property (nonatomic, copy) NSString * lrcName; //歌词文件

@property (nonatomic) NSTimeInterval duration; //时长

@property (nonatomic) BOOL highQuality; //是否高质量
@property (nonatomic) BOOL downloaded; //是否已下载

-(id)initWithDictionaryData:(NSDictionary *)dataDic;

@end
