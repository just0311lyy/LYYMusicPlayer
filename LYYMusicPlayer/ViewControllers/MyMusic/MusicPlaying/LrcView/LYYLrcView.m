//
//  LYYLrcView.m
//  LYYMusicPlayer
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LYYLrcView.h"
#import "LYYLrcLineDO.h"

@interface LYYLrcView () <UITableViewDataSource>
//用于显示歌词的TableView
@property (strong, nonatomic)UITableView *tableView;
//保存歌词的数组,每一行歌词是一个数组中的元素(TRLrcLine)
@property (strong, nonatomic)NSMutableArray *lrcLines;

//当前正在播放的歌词下标
@property (assign, nonatomic)NSInteger currentIndex;
@end

@implementation LYYLrcView
#pragma mark - 初始化方法
//手动创建视图对象时调用此方法
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initializer];
    }
    return self;
}

//使用Storyboard或者xib创建视图对象的时候调用此方法
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializer];
    }
    return self;
}
//从Storyboard中恢复视图时调用
//- (void)awakeFromNib
//{
//
//}

-(void)initializer{
    
    self.backgroundColor = [UIColor clearColor];
    //创建歌词库数组
    self.lrcLines = [[NSMutableArray alloc]init];
    //创建显示歌词的tableView
    self.tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
    //设置tableView的外观
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    //设置数据源
    self.tableView.dataSource = self;
    //显示tableView
    [self addSubview:self.tableView];
    //注册Cell类，以备从队列中dequeue出
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LrcCell"];
}

#pragma mark - tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.lrcLines.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LrcCell"];
    //获取本行歌词对象
    LYYLrcLineDO *line = self.lrcLines[indexPath.row];
    //显示歌词
    cell.textLabel.text = line.words;
    //背景透明
    cell.backgroundColor = [UIColor darkGrayColor];
    //居中对齐
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    //颜色
    cell.textLabel.textColor = [UIColor lightTextColor];
    return cell;
}

-(void)layoutSubviews{
    
    self.tableView.frame = self.bounds;
    self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.frame.size.height * 0.5, 0, self.tableView.frame.size.height * 0.5, 0);
}

-(void)setLrcName:(NSString *)lrcName{
    
    _lrcName = lrcName;
    //解析歌词文件,分解成一个个的可望的行对象(TRLrcLine),保存到数组中
    //1,读取歌词文件
    NSURL *lrcURL = [[NSBundle mainBundle] URLForResource:lrcName withExtension:nil];
    NSError *error = nil;
    //2. 将文件内容全部读入到字符串lrcString中
    NSString *lrcString = [NSString stringWithContentsOfURL:lrcURL encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"写入数据失败，错误原因:%@",error);
    }
    //3. 使用\n分解字符串成每一行的字符串数组
    NSArray *lrcs = [lrcString componentsSeparatedByString:@"\n"];
    NSLog(@"歌词:%@",lrcs);
    //4. 遍历数组,将每一行的字符串变成LYYLrcLine对象
    for (NSString *line in lrcs) {
        //1. 创建一个歌词行对象
        LYYLrcLineDO *lrcLine = [LYYLrcLineDO new];
        //2. 将歌词行对象放入数组保存
        [self.lrcLines addObject:lrcLine];
        //3. 给歌词行对象的time和words属性赋值
        if (![line hasPrefix:@"["]) continue; //如果不是以“[”开头，跳过
        //如果是以[ti:,[ar:,[al:,[t_time:开头
        if ([line hasPrefix:@"[ti:"]&&[line hasPrefix:@"[ar:"]&&[line hasPrefix:@"[al:"]&&[line hasPrefix:@"[t_time:"]) {
            NSString *words = [[line componentsSeparatedByString:@":"] lastObject];
            lrcLine.words = [words substringToIndex:words.length - 2];
            
        }else{  //否则是以“[时间”开头
            
            NSArray *arr = [line componentsSeparatedByString:@"]"];
            lrcLine.time = [[arr firstObject] substringFromIndex:1];
            lrcLine.words = [arr lastObject];
        }
    }
    //5. 重新加载TableView
    [self.tableView reloadData];
}

//当外面改变了此属性的值时,歌词视图就需要滚动
-(void)setCurrentTime:(NSTimeInterval)currentTime{
    
    _currentTime = currentTime;
    //滚动TableView,当前歌曲的播放时间和歌词中的播放时间对比
    //1. 播放歌曲的时间转成字符串
    int min = currentTime / 60;
    int sec = (int)currentTime % 60;
    int msec = (currentTime - (int)currentTime) * 100; //毫秒
    NSString *currentTimeStr = [NSString stringWithFormat:@"%02d:%02d.%02d",min,sec,msec];
    for (int idx = 0; idx < self.lrcLines.count - 1; idx++) {
        LYYLrcLineDO *lrcLine = self.lrcLines[idx];
        LYYLrcLineDO *nextLrcLine = self.lrcLines[idx + 1];
        //歌词中的这一行
        NSString *lineTime = lrcLine.time;
        //歌词中的下一行
        NSString *nextLineTime = nextLrcLine.time;
        //判断这一行是否是正在播放的那一行 currentTimeStr    lineTime
        if ([currentTimeStr compare:lineTime] != NSOrderedAscending && [currentTimeStr compare:nextLineTime] == NSOrderedAscending && self.currentTime !=idx) {
            //正在播放的歌词找到了
            NSLog(@"正在播放:%@,%@",lrcLine.time,lrcLine.words);
            NSIndexPath *p = [NSIndexPath indexPathForRow:idx inSection:0];
            [self.tableView reloadRowsAtIndexPaths:@[p] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView scrollToRowAtIndexPath:p atScrollPosition:UITableViewScrollPositionTop animated:YES];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:p];
            cell.textLabel.textColor = [UIColor greenColor];
            self.currentIndex = idx+1;

        }
    }
  
}






@end
