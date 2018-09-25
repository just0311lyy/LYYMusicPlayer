//
//  LYYMyMusicViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYMyMusicViewController.h"

#import "LYYOwnGroupsTableViewController.h"

#import "LYYMusicLoginViewController.h"

@interface LYYMyMusicViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *allMusic;

@property (weak, nonatomic) IBOutlet UITableViewCell *myLove;
@property (weak, nonatomic) IBOutlet UITableViewCell *musicOfBuilding;
@property (weak, nonatomic) IBOutlet UITableViewCell *recordOfMusic;

@property (weak, nonatomic) IBOutlet UITableViewCell *downloadMusic;
@property (weak, nonatomic) IBOutlet UITableViewCell *latestOfPlaying;
@property (weak, nonatomic) IBOutlet UITableViewCell *iPodMusic;


@end

@implementation LYYMyMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的音乐";

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else if(section ==1){
        return 3;
    }else{
        return 3;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
    }
    switch (indexPath.section) {
        case 0:
            return self.allMusic;
        case 1:
            if (indexPath.row ==0) {
                return self.myLove;
            }else if(indexPath.row ==1){
                return self.musicOfBuilding;
            }else{
                return self.recordOfMusic;
            }
            
        case 2:
            if (indexPath.row ==0) {
                return self.downloadMusic;
            }else if(indexPath.row ==1){
                return self.latestOfPlaying;
            }else{
                return self.iPodMusic;
            }
        default:
            return nil;
    }

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1&&indexPath.row==1) {
        LYYOwnGroupsTableViewController *ogtvc = [self.storyboard  instantiateViewControllerWithIdentifier:@"LYYOwnGroupsTableViewController"];
        [self.navigationController pushViewController:ogtvc animated:YES];
    }
}


- (IBAction)pushLoginView:(UIBarButtonItem *)sender {
    
    LYYMusicLoginViewController *mlvc = [self.storyboard  instantiateViewControllerWithIdentifier:@"LYYMusicLoginViewController"];
    [self.navigationController pushViewController:mlvc animated:YES];
   
}


















@end
