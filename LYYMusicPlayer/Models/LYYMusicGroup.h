//
//  LYYMusicGroup.h
//  LYYMusicPlayer
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, LYYMusicGroupState){
    
    LYYMusicGroupStateNormal,
    LYYMusicGroupStateDownloading,
    LYYMusicGroupStateDownloaded
    
};


@interface LYYMusicGroup : NSObject

@property (nonatomic, copy) NSString * nameOfCategory;

@property (nonatomic, strong) NSArray * musics;

@property (nonatomic) LYYMusicGroupState state;



+(NSArray *)fakeData;

@end
