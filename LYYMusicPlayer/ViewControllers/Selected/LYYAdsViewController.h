//
//  LYYAdsViewController.h
//  LYYMusicPlayer
//
//  Created by apple on 15/11/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYYAdsViewController : UIViewController

@property (nonatomic) CGSize contentSize; //显示界面，（实际设置的界面）
@property (nonatomic,strong) NSArray *imgAds;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIScrollView *scrollView;





@end
