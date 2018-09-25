//
//  NSIndexPath+Check.h
//  LYYMusicPlayer
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (Check)

@property (nonatomic, readonly) NSInteger section;
@property (nonatomic, readonly) NSInteger row;

- (BOOL) isEqualWithRow:(NSUInteger)row inSection:(NSUInteger)section;

- (BOOL) isEqualWithSection:(NSUInteger)section andRow:(NSUInteger)row;

@end
