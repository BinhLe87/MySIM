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
    [background_1 setAccessibilityIdentifier:@"background_1.jpeg"];
    
    UIImage *background_2 = [UIImage imageNamed:@"background_2.jpeg"];
    [background_2 setAccessibilityIdentifier:@"background_2.jpeg"];
    
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
    
    UIImage *selectedImage = [_backgroundImages objectAtIndex:indexPath.row];
    
    [self.presenterDelegate didSelectBackgroundImage:selectedImage];
}




@end
