//
//  LYYAdsViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/11/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYAdsViewController.h"

#import "LYYAds.h"

@interface LYYAdsViewController () <UIScrollViewDelegate,UIPageViewControllerDelegate>

@property (nonatomic,strong) NSArray *imgViews;
//@property (nonatomic) CGSize showSize; //显示界面，（实际设置的界面）
//@property (nonatomic,strong) NSArray *imgAds;
//@property (nonatomic,strong) UIPageControl *pageControl;
//@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation LYYAdsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithScrollView];
}

-(void)initWithScrollView{
    
    self.scrollView = [[UIScrollView alloc] init];
    CGRect frame = CGRectZero;
    frame.size = self.contentSize;
    self.scrollView.frame = frame;  //显示界面
    
    CGSize size = self.scrollView.frame.size;
    size.width *= self.imgAds.count;
    self.scrollView.contentSize = size; //内容界面
    
    for (int i = 0; i<self.imgAds.count; i++) {
        LYYAds *adImages = self.imgAds[i];
        UIImage *image = [UIImage imageNamed:adImages.imgName];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        
        //frame.size = self.showSize;
        frame.origin.x = frame.size.width * i;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
        
    }
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    [self.view addSubview:self.scrollView];
    
    //---------
    
//    self.pageControl = [[UIPageControl alloc]init];
//    self.pageControl.frame = CGRectMake(0, self.scrollView.frame.size.height-40, self.scrollView.frame.size.width, 20);
//    
//    self.pageControl.numberOfPages = self.imgAds.count;
//    self.pageControl.currentPage = 0;
//    self.pageControl.userInteractionEnabled = NO; //关闭事件    
//    [self.view addSubview:self.pageControl];
}

//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    self.pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
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
