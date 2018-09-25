//
//  NSIndexPath+Check.m
//  LYYMusicPlayer
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSIndexPath+Check.h"

@implementation NSIndexPath (Check)

- (BOOL) isEqualWithRow:(NSUInteger)row inSection:(NSUInteger)section{
    
    return self.row == row && self.section == section;
}

- (BOOL) isEqualWithSection:(NSUInteger)section andRow:(NSUInteger)row{
    
    return [self isEqualWithRow:row inSection:section];
}

@end
