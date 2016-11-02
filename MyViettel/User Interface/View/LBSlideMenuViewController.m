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
#import "UIImageView+WebCache.h"

static int LB_SLIDE_MENU_WIDTH_OFFSET = 60;
@interface LBSlideMenuViewController ()

@property(nonatomic) LBSlideMenuHeaderView *headerView;
@end

@implementation LBSlideMenuViewController


#pragma mark - Initializers
-(UITableView *)tableView {
    
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[LBSideMenuTableViewCell class] forCellReuseIdentifier:@"SideMenuTableViewCell"];
    
    //set style
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setShowsVerticalScrollIndicator:NO];
    [_tableView setShowsHorizontalScrollIndicator:NO];
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    _headerView = [LBSlideMenuHeaderView header];
    _headerView.presenterDelegate = self.presenterDelegate;
    self.tableView.tableHeaderView = _headerView;
    
    [_presenterDelegate getData];
}


-(void)updateViewConstraints {
        
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view).offset(-LB_SLIDE_MENU_WIDTH_OFFSET);
    }];
    
    [self.view mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.navigationController.view);
    }];
    
    
    [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
        
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
    
    [super updateViewConstraints];
}


-(void)viewWillAppear:(BOOL)animated {

    self.navigationController.view.frame = [UIScreen mainScreen].bounds;
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidLayoutSubviews {
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [super viewDidLayoutSubviews];
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
-(void)showData:(LBCustomer *)customer menuItemArray:(NSArray *)menuItemArray {
    
    _menuItems = menuItemArray;
    
    LBSlideMenuHeaderView *headerView = (LBSlideMenuHeaderView*)self.tableView.tableHeaderView;
    [headerView.backgroundImage setImage:[customer getBackgroundImg]];
    headerView.cusNameLbl.text = customer.name;
    headerView.cusPhoneLbl.text = customer.phone;
    [headerView.cusAvatarImage sd_setImageWithURL:[NSURL URLWithString:customer.avatar_link]];
    
    [self.tableView reloadData];
}

-(void)updateBackgroundImage:(UIImage *)backgroundImage {
    
    LBSlideMenuHeaderView *headerView = (LBSlideMenuHeaderView*)self.tableView.tableHeaderView;
    [headerView.backgroundImage setImage:backgroundImage];
}



@end
