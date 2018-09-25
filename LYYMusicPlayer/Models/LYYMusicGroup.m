//
//  LYYMusicGroup.m
//  LYYMusicPlayer
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYMusicGroup.h"
#import "LYYMusic.h"
#import "LYYMusicManager.h"

@implementation LYYMusicGroup

+(NSArray *)fakeData{
    
    LYYMusic *music = nil;
    
    NSMutableArray *gwMusics = [NSMutableArray array];
    
    music = [[LYYMusic alloc]init];
    music.musicName     = @"Burn";
    music.album         = @"Burn - Single";
    music.artist        = @"Ellie Goulding";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Summertime Sadness (Cedric Gervais Remix)";
    music.album         = @"Summertime Sadness (Cedric Gervais Remix) - Single";
    music.artist        = @"Lana Del Rey";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Spectrum";
    music.album         = @"Clarity";
    music.artist        = @"Zedd";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"It's Time";
    music.album         = @"It’s Time";
    music.artist        = @"Imagine Dragons";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Dancing in The Moonlight";
    music.album         = @"Dancing In The Moonlight: The Best Of Toploader";
    music.artist        = @"Toploader";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Thinking About You (feat. Ayah Marar)";
    music.album         = @"18 Months (Deluxe Edition)";
    music.artist        = @"Calvin Harris";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"You Make Me (feat. Salem Al Fakir)";
    music.album         = @"True";
    music.artist        = @"Avicii";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Safe and Sound";
    music.album         = @"Capital Cities EP";
    music.artist        = @"Capital Cities";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Reaching Out";
    music.album         = @"Welcome Reality (Deluxe Version)";
    music.artist        = @"nero";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Recover";
    music.album         = @"Recover - EP";
    music.artist        = @"CHVRCHES";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Hold On, We're Going Home (feat. Majid Jordan)";
    music.album         = @"Hold On, We're Going Home (feat. Majid Jordan) - Single";
    music.artist        = @"Drake";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"The Mother We Share";
    music.album         = @"The Mother We Share - Single";
    music.artist        = @"CHVRCHES";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Promises";
    music.album         = @"nero";
    music.artist        = @"Promises - EP";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Alone Together";
    music.album         = @"Save Rock and Roll";
    music.artist        = @"Fall Out Boy";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Reload (Radio Edit)";
    music.album         = @"Reload (Radio Edit) - Single";
    music.artist        = @"Sebastian Ingrosso";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"I Love It (feat. Charli XCX)";
    music.album         = @"Iconic";
    music.artist        = @"Icona Pop";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Feel the Love";
    music.album         = @"Feel the Love (feat. John Newman) [Remixes] - EP";
    music.artist        = @"Rudimental";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Goin' Crazy (feat. Robbie Williams)";
    music.album         = @"Goin' Crazy (feat. Robbie Williams) - Single";
    music.artist        = @"Dizzee Rascal";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Still Into You";
    music.album         = @"Paramore";
    music.artist        = @"Paramore";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Heart Attack";
    music.album         = @"Demi";
    music.artist        = @"Demi Lovato";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Explosions";
    music.album         = @"Halcyon (Deluxe Edition)";
    music.artist        = @"Ellie Goulding";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"I Need Your Love (feat. Ellie Goulding)";
    music.album         = @"I Need Your Love";
    music.artist        = @"Calvin Harris";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Starry Eyed";
    music.album         = @"Bright Lights";
    music.artist        = @"Ellie Goulding";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Lights (Single Version)";
    music.album         = @"Bright Lights";
    music.artist        = @"Ellie Goulding";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];
    
    music = [[LYYMusic alloc] init];
    music.musicName     = @"Who's That Chick?";
    music.album         = @"Who's That Chick - Single";
    music.artist        = @"David Guetta";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:2 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gwMusics addObject:music];

    NSMutableArray *gnMusics = [NSMutableArray array];
    music = [[LYYMusic alloc]init];
    music.musicName = @"爱情转移";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"浮夸";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"绿咔";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"1874";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"好久不见";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"因为爱情";
    music.artist= @"陈奕迅，王菲";
    music.singerIcon    = @"wf.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"背包";
    music.artist= @"陈奕迅";
    music.singerIcon    = @"eason.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"一眼万年";
    music.artist= @"SHE";
    music.singerIcon    = @"album_placeholder.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    
    music = [[LYYMusic alloc]init];
    music.musicName = @"青花瓷";
    music.artist= @"周杰伦";
    music.singerIcon    = @"jay.jpg";
    music.duration      = [self durationWithMinutes:3 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [gnMusics addObject:music];
    

    LYYMusicGroup * foreignMusic = [[LYYMusicGroup alloc] init];
    foreignMusic.nameOfCategory = @"国外单曲";
    foreignMusic.musics = [gwMusics copy];
    foreignMusic.state = LYYMusicGroupStateDownloaded;
    
    LYYMusicGroup * internalMusic = [[LYYMusicGroup alloc] init];
    internalMusic.nameOfCategory = @"国内";
    internalMusic.musics = [gnMusics copy];
    internalMusic.state = LYYMusicGroupStateDownloaded;
    
    LYYMusicGroup * foreignAlbum = [[LYYMusicGroup alloc] init];
    foreignAlbum.nameOfCategory = @"国外专辑";
    foreignAlbum.musics = [gwMusics copy];
    foreignAlbum.state = LYYMusicGroupStateDownloaded;
    
    LYYMusicGroup * oldMusic = [[LYYMusicGroup alloc] init];
    oldMusic.nameOfCategory = @"怀旧";
//    oldMusic.musics = [self musicsFromPlist:@"Musics.plist"];
    oldMusic.musics = [LYYMusicManager musicsFromPlist:@"Musics.plist"];
    oldMusic.state = LYYMusicGroupStateDownloaded;
    
    return @[foreignMusic,internalMusic,foreignAlbum,oldMusic];
}

//+(NSArray *)musicsFromPlist:(NSString *)plist{
//    NSURL *url = [[NSBundle mainBundle]URLForResource:plist withExtension:nil];
//    NSArray *objs = [NSArray arrayWithContentsOfURL:url];
//    NSMutableArray *hjmusics = [[NSMutableArray alloc]init];
//    for (NSDictionary *dict in objs) {
//        LYYMusic *m = [[LYYMusic alloc] initWithDictionaryData:dict];
////        [m setValuesForKeysWithDictionary:dict];
//
//        [hjmusics addObject:m];
//    }
//    return [hjmusics copy];
//}

+ (NSTimeInterval) durationWithMinutes:(int)minutes andSeconds:(int)seconds
{
    return minutes * 60 + seconds;
}

@end
