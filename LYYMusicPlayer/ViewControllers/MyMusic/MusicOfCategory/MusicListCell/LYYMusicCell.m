//
//  LYYMusicCell.m
//  LYYMusicPlayer
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LYYMusicCell.h"

#import "UIImage+Circle.h"

@implementation LYYMusicCell

- (void)setMusic:(LYYMusic *)music
{
    _music = music;
    self.textLabel.text = music.musicName;
    self.detailTextLabel.text = music.artist;
    UIImage *image = [UIImage imageNamed:music.musicIcon];
    image = [UIImage scaleToSize:image size:CGSizeMake(self.bounds.size.height - 10, self.bounds.size.height - 10)];
    self.imageView.image = [UIImage circleImageWithImage:image borderWidth:2 borderColor:[UIColor blackColor]];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
