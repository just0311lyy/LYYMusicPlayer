//
//  LYYSelectedViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYSelectedViewController.h"
#import "LYYAdsViewController.h"
#import "LYYAds.h"
@interface LYYSelectedViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong)LYYAdsViewController *adsViewController;
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation LYYSelectedViewController

#define CHANNEL_SPACE_FILLED_BY_ADS 2   //ad图占电台图的数
#define CHANNELS_PER_PAGE           6   //每页电台图数
#define CHANNELS_PER_ROW            2   //每行电台数

#define CHANNEL_GAP_SPACE           4.0  //电台空隙

//#define CHANNEL_ITEM_WIDTH          154.0  //电台图宽
//#define CHANNEL_ITEM_HEIGHT         142.0  //电台图高
#define CHANNEL_ITEM_WIDTH     (SCREEN_WIDTH - 12) / 2                //电台图宽
#define CHANNEL_ITEM_HEIGHT    (CHANNEL_ITEM_WIDTH * 142.0 / 154.0 )  //电台图高

//#define AD_WIDTH                    312.0  //ad图宽
//#define AD_HEIGHT                   142.0  //ad图高
#define AD_WIDTH         (SCREEN_WIDTH - 8)           //ad图宽
#define AD_HEIGHT        (AD_WIDTH / 312.0 * 142.0 )  //ad图高


#define SCREEN_WIDTH     self.view.bounds.size.width
#define SCREEN_HEIGHT    self.view.bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精选";
    
    [self initAds];
    [self initChannels];
}

-(void)initAds{
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.adsViewController = [[LYYAdsViewController alloc]init];
    LYYAds * ad1 = [[LYYAds alloc] init];
    ad1.imgName = @"ad01.png";
    LYYAds * ad2 = [[LYYAds alloc] init];
    ad2.imgName = @"ad02.png";
    LYYAds * ad3 = [[LYYAds alloc] init];
    ad3.imgName = @"ad03.png";
    LYYAds * ad4 = [[LYYAds alloc] init];
    ad4.imgName = @"ad04.png";
    LYYAds * ad5 = [[LYYAds alloc] init];
    ad5.imgName = @"ad05.png";
    self.adsViewController.imgAds = @[ad1, ad2, ad3, ad4, ad5];
    self.adsViewController.contentSize = CGSizeMake(AD_WIDTH, AD_HEIGHT);
    self.adsViewController.view.frame = CGRectMake(CHANNEL_GAP_SPACE, CHANNEL_GAP_SPACE, AD_WIDTH, AD_HEIGHT);
    [self.scrollView addSubview:self.adsViewController.view];
    
}

-(void)initChannels{
    
    
    
    self.channels = @[@"channel01.png", @"channel02.png", @"channel03.png",
                      @"channel04.png", @"channel05.png", @"channel06.png",
                      @"channel07.png", @"channel08.png", @"channel09.png"];
    int numberOfPages = (self.channels.count + CHANNEL_SPACE_FILLED_BY_ADS - 1) / CHANNELS_PER_PAGE + 1;
    
//    self.pageControl.numberOfPages = numberOfPages;
//
//    self.pageControl.currentPage = 0;

    
    for (int i = 0; i < self.channels.count; i++){
        
        NSString *channelImgName = self.channels[i];
        int index = i + CHANNEL_SPACE_FILLED_BY_ADS;
        int page = index / CHANNELS_PER_PAGE;  //图片所在当前页
        int column = index % CHANNELS_PER_ROW; //图片所在当前行
        int row = (index % CHANNELS_PER_PAGE) / CHANNELS_PER_ROW; //图片所在列的位置
        
        CGPoint pageOffSet = CGPointMake(page *self.scrollView.frame.size.width, 0);
        CGRect frame = CGRectZero;
        frame.origin.x = pageOffSet.x + CHANNEL_GAP_SPACE + (CHANNEL_GAP_SPACE + CHANNEL_ITEM_WIDTH) * column;
        frame.origin.y = CHANNEL_GAP_SPACE + (CHANNEL_GAP_SPACE + CHANNEL_ITEM_HEIGHT) * row;
        frame.size.width = CHANNEL_ITEM_WIDTH;
        frame.size.height = CHANNEL_ITEM_HEIGHT;
        
        UIImage *image = [UIImage imageNamed:channelImgName];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
    }
    
    CGSize size = self.scrollView.frame.size;
    size.width *= numberOfPages;
    self.scrollView.contentSize = size;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, SCREEN_HEIGHT - 130, SCREEN_WIDTH, 14);
    pageControl.numberOfPages = numberOfPages;
    
    pageControl.tintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.currentPage = 0;
//    pageControl.userInteractionEnabled = NO; //关闭事件
    self.pageControl = pageControl;
//    self.pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.pageControl];
    
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    self.pageControl.currentPage = round(offset.x / scrollView.frame.size.width);
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    CGSize size = self.scrollView.frame.size;
//    size.width *= self.pageControl.numberOfPages;
//    self.scrollView.contentSize = size;
//    
//}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
