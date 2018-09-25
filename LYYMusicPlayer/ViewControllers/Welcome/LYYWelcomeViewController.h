//
//  LYYWelcomeViewController.h
//  LYYMusicPlayer
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYYGuidanceViewDismissBlock)();
@interface LYYWelcomeViewController : UIViewController

@property (nonatomic,copy)LYYGuidanceViewDismissBlock dismissBlock;

@end
