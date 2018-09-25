//
//  LYYMusicPlayingViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LYYMusicPlayingViewController.h"
#import "LYYLrcView.h"

#import "LYYMusic.h"
#import "LYYMusicPlayer.h"
#import "LYYMusicManager.h"

#import "UIView+Rotation.h"
#import "UIImage+Circle.h"

#import <AVFoundation/AVFoundation.h>

#define NormalColor [UIColor colorWithRed:45.0 / 255 green:184.0 / 255 blue:105.0 / 255 alpha:1.0]

@interface LYYMusicPlayingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImgView;
@property (weak, nonatomic) IBOutlet UIProgressView *playProgressView;
@property (weak, nonatomic) IBOutlet UILabel *leftTimeLb;
@property (weak, nonatomic) IBOutlet UILabel *rightTimeLb;
@property (weak, nonatomic) IBOutlet UIImageView *singerImgView;
@property (weak, nonatomic) IBOutlet LYYLrcView *lrcView;

@property (strong, nonatomic) UIVisualEffectView *blurEffectView;
//当前正在播放的音乐
@property (strong,nonatomic)LYYMusic *playingMusic;
//当前的播放器
@property (strong,nonatomic)AVAudioPlayer *player;
//歌词更新计时器
@property (strong, nonatomic)CADisplayLink *lrcTimer;
@end

@implementation LYYMusicPlayingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //播放进度条的颜色
    self.playProgressView.tintColor = NormalColor;
    //歌词视图初始为不可见
    self.lrcView.hidden = YES;

}

//显示当前VC的视图
- (void)show
{
    //1. 拿Window对象
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    //2. 将此VC中的View添加到Window对象中
    self.view.frame = window.bounds;
    //3. 设置背景和前景图片
    [self setBackAndSingerImage];
    //4. 加入到window视图中
    [window addSubview:self.view];
    //5. 在self.view的上面铺层毛玻璃(毛琉璃是个视图)
    [self.view insertSubview:self.blurEffectView atIndex:1];
    //6. 用动画的方式将View显示出来
    CGRect endFrame = self.view.frame;
    CGRect startFrame = endFrame;
    startFrame.origin.y = startFrame.size.height;
    self.view.frame = startFrame;
    [UIView animateWithDuration:1.0 animations:^{
        self.view.frame = endFrame;
//        self.lrcView.hidden = YES;       //隐藏歌词视图
        //7. 让歌手图片旋转
        [self.singerImgView rotate:6];
        //8. 开始播放音乐
        [self startPlayMusic];
    }];
    
    
}
#pragma mark - 事件方法
//返回上级VC
- (IBAction)backTap:(UIButton *)sender {
    

    
    CGRect startFrame = self.view.frame;
    CGRect endFrame = startFrame;
    endFrame.origin.y = endFrame.size.height;
    self.view.frame = startFrame;
    [UIView animateWithDuration:1.0 animations:^{
        self.view.frame = endFrame;
        [self.view removeFromSuperview];
        
    }];
}

//显示歌词
- (IBAction)lrcBtnTap:(UIButton *)sender {
    
    if (self.lrcView.hidden) {               //如果歌词视图不可见
        self.singerImgView.hidden = YES;     //隐藏歌手图片
        [self.singerImgView stopRotation];   //停止动画播放
        self.lrcView.hidden = NO;            //显示歌词视图
        //设置歌词文件名给歌词视图
        LYYMusic *music = [LYYMusicManager playingMusic];
        self.lrcView.lrcName = music.lrcName;
        //启动歌词更新的计时器
        [self startLrcTimer];
    }else{                               //如果歌词视图可见
        self.lrcView.hidden = YES;       //隐藏歌词视图
        self.singerImgView.hidden = NO;  //显示歌手图片
        [self.singerImgView rotate:6];   //开始播放动画
        [self endLrcTimer];
        
    }
}

//播放按钮
- (IBAction)playBtnTap:(UIButton *)sender {
    
    if ([self.player isPlaying]) {//如果已经在播放歌曲
        [LYYMusicPlayer pauseMusic:self.playingMusic.musicName];//歌曲暂停播放
        sender.selected = NO;//播放按钮恢复为初始状态
        
    }else { //如果歌曲已经是暂停播放状态
        [LYYMusicPlayer playMusic:self.playingMusic.musicName];//重新恢复播放
        sender.selected = YES;//按钮变为暂停状态
    }
    
}
//下一首
- (IBAction)nextBtnTap:(UIButton *)sender {
    
    //设置当前要播放的歌曲为下一首
    [LYYMusicManager setPlayingMusic:[LYYMusicManager nextMusic]];
    //重新设置背景和歌手图片
    [self setBackAndSingerImage];
    //开始播放
    [self startPlayMusic];

}
//上一首
- (IBAction)preBtnTap:(UIButton *)sender {
    
    //1. 设置当前要播放的歌曲为上一首
    [LYYMusicManager setPlayingMusic:[LYYMusicManager previousMusic]];
    //2. 重新设置背景和歌手图片
    [self setBackAndSingerImage];
    //3. 开始播放
    [self startPlayMusic];
    
    
}

#pragma mark - 属性定义
//毛玻璃效果视图对象
- (UIVisualEffectView *)blurEffectView
{
    if (!_blurEffectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    }
    _blurEffectView.frame = self.view.frame;
    return _blurEffectView;
}

#pragma mark - 私有方法
//开始播放音乐
- (void)startPlayMusic
{
    //1. 如果要播放的歌正在播放，则直接返回
    if ([LYYMusicManager playingMusic] == self.playingMusic) {
        return;
    }
    //2. 停止当前正在播放的音乐
    if (self.playingMusic) {
        [LYYMusicPlayer stopMusic:self.playingMusic.musicName];
    }
    //3. 获取新的要播放的音乐
    self.playingMusic = [LYYMusicManager playingMusic];
    //4. 播放音乐,将播放这首歌的播放器保存起来
    self.player = [LYYMusicPlayer playMusic:self.playingMusic.musicName];
    //5. 转换播放按钮
    self.playBtn.selected = YES;
    
    //6. 启动计时器控制播放进度条和时间标签的变化
    [self startPlayingTimer];
}

//设置播放器的背景和前景图片
- (void)setBackAndSingerImage
{
    //1. 获取当前正在播放的歌曲
    LYYMusic *music = [LYYMusicManager playingMusic];
    //2. 从歌曲对象中获取背景和前景图片名
    NSString *backImageName = @"album_placeholder.jpg";
    NSString *singerImageName = @"album_placeholder.jpg";
    if (music) {
        backImageName = singerImageName = music.singerIcon;
    }
    //3. 设置背景
    self.backgroundImgView.image = [UIImage imageNamed:backImageName];
    //4. 设置前景(歌手图片)
    UIImage *image = [UIImage imageNamed:singerImageName];
    image = [UIImage scaleToSize:image size:self.singerImgView.frame.size];
    self.singerImgView.image = [UIImage circleImageWithImage:image borderWidth:10 borderColor:[UIColor lightGrayColor]];
}

//开启歌词更新计时器
-(void)startLrcTimer{
    
    //如果没有播放或歌词视图没有显示,不要启动歌词更新计时器
    if (self.player.playing == NO || self.lrcView.hidden) {
        return;
    }
    //先结束，确保同一时间只有一个计时器在工作
//    [self endLrcTimer];
    //创建计时器
    self.lrcTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLrc)];
    //加入时间循环队列
    [self.lrcTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
 
}
//结束歌词更新计时器
-(void)endLrcTimer{
    
    [self.lrcTimer invalidate];
    self.lrcTimer = nil;
}
//被歌词计时器频繁调用的方法
-(void)updateLrc{
    
    self.lrcView.currentTime = self.player.currentTime;
}

//启动计时器
-(void)startPlayingTimer{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

//计时器每秒调用的方法
-(void)updateTimer:(NSTimer *)timer{
    
    //1.更新播放进度条
    //歌曲的总时间
    NSTimeInterval duration = self.player.duration;
    //当前的播放时间
    NSTimeInterval currentTime = self.player.currentTime;
    self.playProgressView.progress = currentTime *1.0 / duration;
    //2.更新播放当前时间标签
    self.rightTimeLb.text = [self stringByTime:duration];
    self.leftTimeLb.text = [self stringByTime:currentTime];
}

//将秒转换成xx：xx的时间字符串
-(NSString *)stringByTime:(NSTimeInterval)time{
    
    int min = time / 60;
    int sec = (int)time % 60;
    return [NSString stringWithFormat:@"%02d:%02d",min,sec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
