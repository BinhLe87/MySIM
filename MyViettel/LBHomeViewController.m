//
//  HomeViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeViewController.h"
#import "LBHomeHeaderView.h"
#import "Masonry.h"

@interface LBHomeViewController ()

@end

@implementation LBHomeViewController


-(UITableView *)tableView {
    
    if(_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
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
    
    //register class for tableCell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LBHomeTableViewCell"];
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LBHomeHeaderView *headerView = [LBHomeHeaderView header];
    self.tableView.tableHeaderView = headerView;
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.equalTo([NSNumber numberWithFloat:[LBHomeHeaderView heightForHeaderView]]);
        make.top.equalTo(self.tableView.mas_top);
        make.left.equalTo(self.tableView.mas_left);
        make.width.equalTo(self.tableView.mas_width);
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LBHomeTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Test";
    
    return cell;
}


@end
