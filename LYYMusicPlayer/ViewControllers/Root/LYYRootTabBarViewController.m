//
//  LYYRootTabBarViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYRootTabBarViewController.h"

#import "LYYMyMusicViewController.h"
#import "LYYSelectedViewController.h"
#import "LYYMusicStoreTableViewController.h"
#import "LYYMoreViewTableViewController.h"


@interface LYYRootTabBarViewController ()

@end

@implementation LYYRootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithControllers];
}

-(void)initWithControllers{
    
    //UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LYYMyMusicViewController *myMusicVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMyMusicViewController"];
    UINavigationController *myMusicNav = [[UINavigationController alloc] initWithRootViewController:myMusicVC];
    myMusicVC.tabBarItem.title = @"我的音乐";
    myMusicVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_my_music.png"] ;
    myMusicVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_my_music_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LYYSelectedViewController *selectedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYSelectedViewController"];
    UINavigationController *selectedNav = [[UINavigationController alloc] initWithRootViewController:selectedVC];
    selectedVC.tabBarItem.title = @"精选";
    selectedVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_selected.png"];
    selectedVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_selected_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LYYMusicStoreTableViewController *musicStoreVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMusicStoreTableViewController"];
    UINavigationController *musicStoreNav = [[UINavigationController alloc] initWithRootViewController:musicStoreVC];
    musicStoreVC.tabBarItem.title = @"乐库";
    musicStoreVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_store.png"];
    musicStoreVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_store_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LYYMoreViewTableViewController *moreVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMoreViewTableViewController"];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreVC.tabBarItem.title = @"更多";
    moreVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_more.png"];
    moreVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_more_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    

    self.viewControllers = @[myMusicNav,selectedNav,musicStoreNav,moreNav];
    self.selectedIndex = 0;
    //self.tabBar.backgroundColor = [UIColor lightGrayColor];
    
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
