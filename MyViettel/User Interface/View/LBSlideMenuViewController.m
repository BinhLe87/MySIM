//
//  SlideMenuViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuViewController.h"
#import "LBSideMenuTableViewCell.h"
#import "LBSlideMenuHeaderView.h"
#import "Masonry.h"

@interface LBSlideMenuViewController ()

@end

@implementation LBSlideMenuViewController


#pragma mark - Initializers
-(UITableView *)tableView {
    
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[LBSideMenuTableViewCell class] forCellReuseIdentifier:@"SideMenuTableViewCell"];
    
    //set style
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setShowsVerticalScrollIndicator:NO];
    [_tableView setShowsHorizontalScrollIndicator:NO];
    
    //layout tableview
    NSDictionary *metrics = nil;
    NSDictionary *views = @{@"tableview": _tableView};
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableview]|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableview]|" options:0 metrics:metrics views:views]];
    
    return _tableView; 
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LBSlideMenuHeaderView *headerView = [LBSlideMenuHeaderView header];
    headerView.slideMenuVC = self;
    self.tableView.tableHeaderView = headerView;
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.equalTo([NSNumber numberWithFloat:[LBSlideMenuHeaderView heightForHeaderView]]);
        make.width.equalTo(self.tableView.mas_width);
        make.top.equalTo(self.tableView.mas_top);
        make.left.equalTo(self.tableView.mas_left);
    }];
    
    [self.tableView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([NSStringFromClass([obj class]) isEqualToString:@"UITableViewWrapperView"]) {
            
            [obj setTranslatesAutoresizingMaskIntoConstraints:NO];
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.equalTo(self.tableView.tableHeaderView.mas_bottom);
                make.left.equalTo(self.tableView.tableHeaderView.mas_left);
                make.width.equalTo(self.tableView.tableHeaderView.mas_width);
                make.height.equalTo(self.tableView.tableHeaderView.mas_height);
            }];
        }
    }];
    

    
    [_presenterDelegate getData];
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
    
    return _menuItems.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [LBSideMenuTableViewCell heightForTableViewCell];
}

/*-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    LBSlideMenuHeaderView *headerView = [LBSlideMenuHeaderView header];
    headerView.slideMenuVC = self;
    
    return headerView;
}*/



/*-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return [LBSlideMenuHeaderView heightForHeaderView];
}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LBSideMenuTableViewCell *cell = (LBSideMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SideMenuTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    LBSideMenuTableViewCell *item = [_menuItems objectAtIndex:indexPath.row];
    
    cell.menuIcon = item.menuIcon;
    cell.menuItemTitle = item.menuItemTitle;
    cell.hasSeperatorLine = item.hasSeperatorLine;
    
    [cell setupUI];
    
    
    
    return cell;
}


#pragma mark - LBSlideMenuViewControllerDelegate
-(void)showData:(NSArray *)menuItemArray backgroundImgInHeaderView:(UIImage *)backgroundImage{
    
    _menuItems = menuItemArray;
    
    if(backgroundImage) {
        
        LBSlideMenuHeaderView *headerView = (LBSlideMenuHeaderView*)self.tableView.tableHeaderView;
        [headerView.backgroundImage setImage:backgroundImage];
    }
    
    [self.tableView reloadData];
}

-(void)updateBackgroundImage:(UIImage *)backgroundImage {
    
    LBSlideMenuHeaderView *headerView = (LBSlideMenuHeaderView*)self.tableView.tableHeaderView;
    [headerView.backgroundImage setImage:backgroundImage];
}


@end
