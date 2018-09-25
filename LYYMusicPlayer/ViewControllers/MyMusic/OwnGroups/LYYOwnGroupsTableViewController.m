//
//  LYYOwnGroupsTableViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LYYOwnGroupsTableViewController.h"

#import "LYYMusicGroup.h"

#import "LYYMusicPlayingViewController.h"

#import "LYYMusicListTableViewController.h"

@interface LYYOwnGroupsTableViewController ()

//@property (weak, nonatomic) IBOutlet UITableViewCell *foreignMusic;
//
//@property (weak, nonatomic) IBOutlet UITableViewCell *demosticMusic;
//
//@property (weak, nonatomic) IBOutlet UITableViewCell *foreignAblum;
//
//@property (weak, nonatomic) IBOutlet UITableViewCell *pastMusic;


@end

@implementation LYYOwnGroupsTableViewController

-(NSArray *)groups{
    if (!_groups) {
        _groups = [LYYMusicGroup fakeData];
    }
    return _groups;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.font = [UIFont systemFontOfSize:18];
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }
    LYYMusicGroup * group = self.groups[indexPath.row];
    cell.textLabel.text = group.nameOfCategory;
//    cell.detailTextLabel.text = @"已下载";
    NSString * append = @"";
    if (group.state == LYYMusicGroupStateDownloading) {
        append = @"，正在下载";
    } else if(group.state == LYYMusicGroupStateDownloaded) {
        append = @"，全部已下载";
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu首%@", group.musics.count, append];
//    switch (indexPath.row) {
//        case 0:
//            return self.foreignMusic;
//        case 1:
//            return self.demosticMusic;
//            
//        case 2:
//            return self.foreignAblum;
//        default:
//            return self.pastMusic;
//    }
    return cell;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    LYYMusicOfCategoryTableViewController *moctvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMusicOfCategoryTableViewController"];
//
//    moctvc.group = self.groups[indexPath.row];
//
//    [self.navigationController pushViewController:moctvc animated:YES];
    
    LYYMusicListTableViewController *mltvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LYYMusicListTableViewController"];
    
    mltvc.group = self.groups[indexPath.row];
    
    [self.navigationController pushViewController:mltvc animated:YES];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"Musics Segue"]) {
//        LYYMusicPlayingViewController * musicViewController = segue.destinationViewController;
//        
//        UITableViewCell * cell = sender;
//        [cell setSelected:NO animated:YES];
//        NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
//        musicViewController.group = self.groups[indexPath.row];
//        
//    }
//}


@end
