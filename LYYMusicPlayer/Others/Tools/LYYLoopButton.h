//
//  LYYLoopButton.h
//  LYYMusicPlayer
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYYLoopButton : UIButton

- (void)setLoopImages:(NSArray *)images;

- (void)setLoopImages:(NSArray *)images andHighlightedImages:(NSArray *)highlightedImages;

@property (nonatomic) NSUInteger currentIndex;


@end
