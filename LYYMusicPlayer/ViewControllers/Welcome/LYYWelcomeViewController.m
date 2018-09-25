//
//  LYYWelcomeViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYWelcomeViewController.h"

#import "LYYRootTabBarViewController.h"

@interface LYYWelcomeViewController () <UIScrollViewDelegate,UIPageViewControllerDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIPageControl *pageControl;




@end

@implementation LYYWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithScrollView];

}

-(void)initWithScrollView{
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.pagingEnabled = YES; //是否分页效果
    self.scrollView.showsHorizontalScrollIndicator = NO; //是否显示水平滚动条
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    NSArray *welcomeImages = @[@"Welcome_3.0_1.jpg",@"Welcome_3.0_2.jpg",@"Welcome_3.0_3.jpg",@"Welcome_3.0_4.jpg",@"Welcome_3.0_5.jpg"];
    
    for (int i = 0; i < welcomeImages.count; i++) {
        
        UIImage *image = [UIImage imageNamed:welcomeImages[i]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGRect frame = self.scrollView.frame;
        frame.origin.x = i * frame.size.width;
        frame.origin.y = 0;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
        
        
        //欢迎界面首页进入
        if (i == 0) {
            
            UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [nextBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
            nextBtn.frame = imageView.frame;
            [self.scrollView addSubview:nextBtn];
        }
        
        
        
        
        //欢迎界面最后一页点击进入
        if (i == welcomeImages.count - 1) {
            
            UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [nextBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
            nextBtn.frame = imageView.frame;
            [self.scrollView addSubview:nextBtn];
        }
    }
    
    CGSize size = self.scrollView.frame.size;
    size.width *= welcomeImages.count;
    self.scrollView.contentSize = size;
    self.scrollView.delegate = self;
    
    //page control
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 20);
    pageControl.numberOfPages = welcomeImages.count;
    pageControl.currentPage = 0;
    pageControl.userInteractionEnabled = NO; //关闭事件
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}

#pragma mark - enterMainVC
-(void)start:(id)sender{
    
//    LYYRootTabBarViewController *rootVC =[self.storyboard instantiateViewControllerWithIdentifier:@"LYYRootTabBarViewController"];
//    UINavigationController *navRoot = [[UINavigationController alloc]initWithRootViewController:rootVC];
//    rootVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    
//    [self presentViewController:navRoot animated:YES completion:nil];
    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    LYYRootTabBarViewController *rootVC =[self.storyboard  instantiateViewControllerWithIdentifier:@"LYYRootTabBarViewController"];
//    UINavigationController *navRoot = [[UINavigationController alloc]initWithRootViewController:rootVC];
//    window.rootViewController = navRoot;
    if (self.dismissBlock != nil) {
        self.dismissBlock();
    }
    
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
}


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
