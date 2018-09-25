//
//  LYYMusicListTableViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LYYMusicListTableViewController.h"

#import "LYYMusicCell.h"
#import "LYYMusicPlayingViewController.h"

#import "LYYMusicManager.h"

@interface LYYMusicListTableViewController ()
@property(strong, nonatomic)LYYMusicPlayingViewController *playingVC;
@end

@implementation LYYMusicListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.group.nameOfCategory;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.group.musics.count;
    return [LYYMusicManager musics].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LYYMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LYYMusicCell" forIndexPath:indexPath];
//    LYYMusic * music = self.group.musics[indexPath.row];
    LYYMusic * music = [LYYMusicManager musics][indexPath.row];
    cell.music = music;
    
//    cell.textLabel.text = music.musicName;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", music.artist, music.album];
    return cell;
}

#pragma mark - tableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    LYYMusicPlayingViewController *mptvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMusicPlayingViewController"];
//    mptvc.playMusic = self.group.musics[indexPath.row];
//    mptvc.playingList = self.group.musics;
//
//    [self.navigationController pushViewController:mptvc animated:YES];
    LYYMusic *music = [LYYMusicManager musics][indexPath.row];
    [LYYMusicManager setPlayingMusic:music];
    
    [self.playingVC show];
}
- (LYYMusicPlayingViewController *)playingVC
{
    if (!_playingVC) {
        _playingVC = [[LYYMusicPlayingViewController alloc]initWithNibName:@"LYYMusicPlayingViewController" bundle:nil];
    }
    return _playingVC;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
