//
//  AppDelegate.h
//  LYYMusicPlayer
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYYMyMusicViewController,LYYSelectedViewController,LYYMusicStoreViewController,LYYMoreViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    NSInteger index;
    NSMutableArray * array;
}
//@property (strong, nonatomic) LYYMyMusicViewController *myMusicVC;
//@property (strong, nonatomic) UINavigationController * myMusicNav;
//
//@property (strong, nonatomic) LYYSelectedViewController * selectedVC;
//@property (strong, nonatomic) UINavigationController * selectedNav;
//
//@property (strong, nonatomic) LYYMusicStoreViewController * musicStoreVC;
//@property (strong, nonatomic) UINavigationController * musicStoreNav;
//
//@property (strong, nonatomic) LYYMoreViewController * moreVC;
//@property (strong, nonatomic) UINavigationController * moreNav;
//
//@property (strong, nonatomic) UITabBarController * tabBarController;


@property (strong, nonatomic) UIWindow *window;


@end

