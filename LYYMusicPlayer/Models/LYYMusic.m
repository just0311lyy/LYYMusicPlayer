//
//  LYYMusic.m
//  LYYMusicPlayer
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYMusic.h"

@implementation LYYMusic

-(id)initWithDictionaryData:(NSDictionary *)dataDic {
    
    if (self = [super init]) {
        
        self.musicName    = dataDic[@"name"];
//        self.album        = dataDic[@""];
        self.artist       = dataDic[@"singer"];
        
//        self.highQuality  = dataDic[@"highlighted_icon"];
//        self.downloaded   = dataDic[@"small_icon"];
        self.highQuality  = YES;
        self.downloaded   = YES;
        
        self.musicIcon    = dataDic[@"icon"];
        self.singerIcon   = dataDic[@"singerIcon"];
        
        self.fileName     = dataDic[@"fileName"];
        self.lrcName      = dataDic[@"lrcName"];
    }
    
    return self;
}
    
@end
