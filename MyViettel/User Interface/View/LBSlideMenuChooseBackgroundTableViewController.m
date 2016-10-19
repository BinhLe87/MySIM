//
//  LBSlideMenuChooseBackgroundTableViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuChooseBackgroundTableViewController.h"
#import "LBSlideMenuChooseBackgroundTableViewCell.h"
#import "Masonry.h"

@interface LBSlideMenuChooseBackgroundTableViewController ()

@property(nonatomic) NSArray *backgroundImages;

@end

@implementation LBSlideMenuChooseBackgroundTableViewController


-(NSArray *)backgroundImages {
    
    if (_backgroundImages) return _backgroundImages;
    
    UIImage *background_1 = [UIImage imageNamed:@"background_1.jpeg"];
    UIImage *background_2 = [UIImage imageNamed:@"background_2.jpeg"];
    
    _backgroundImages = [NSArray arrayWithObjects:background_1, background_2, nil];
    
    return _backgroundImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[LBSlideMenuChooseBackgroundTableViewCell class] forCellReuseIdentifier:@"LBSlideMenuChooseBackgroundTableViewCell"];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setShowsHorizontalScrollIndicator:NO];
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

    return self.backgroundImages.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [LBSlideMenuChooseBackgroundTableViewCell heightForTableCell];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"LBSlideMenuChooseBackgroundTableViewCell";
    LBSlideMenuChooseBackgroundTableViewCell *cell = (LBSlideMenuChooseBackgroundTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setBackgroundImage:[_backgroundImages objectAtIndex:indexPath.row]];

    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.slideMenuViewController.presenterDelegate didSelectBackgroundImage:[_backgroundImages objectAtIndex:indexPath.row]];
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
