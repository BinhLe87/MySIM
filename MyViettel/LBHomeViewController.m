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
#import "LBCustomer.h"
#import "LBAccount.h"
#import "UIImageView+WebCache.h"

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
    
    //add headerView
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
    
    //register class for tableCell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LBHomeTableViewCell"];
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fillDataGUI];
}

-(void)fillDataGUI {
    
    LBCustomer *customerEntity = [self.presenterDelegate getCustomerInfo];
    LBHomeHeaderView *headerView = (LBHomeHeaderView*)self.tableView.tableHeaderView;
    
    [headerView.cusNameLbl setText:customerEntity.name];
    [headerView.CusInfoLbl setText:[NSString stringWithFormat:@"%@ | %@", customerEntity.phone, customerEntity.package_name]];
    [headerView.cusAvatarImageView sd_setImageWithURL:[NSURL URLWithString:customerEntity.avatar_link] placeholderImage:[UIImage imageNamed:LB_DEFAULT_AVATAR]];
    [headerView.backgroundImageView setImage:[[SDImageCache sharedImageCache] imageFromDiskCacheForKey:LB_CUSTOMER_AVATAR_KEY]];
    
    for (LBAccount *account in customerEntity.accounts) {
        
        if ([account.name isEqualToString:@"TK GỐC"]) {
            
            [headerView.BasicAccountNameLbl setText:@"TK GỐC"];
            [headerView.BasicAccountValueLbl setText:[NSString stringWithFormat:@"%@ %@", account.amount, account.unit]];
        } else if ([account.name isEqualToString:@"TK K.MÃI"]) {
            
            [headerView.PromAccountNameLbl setText:@"TK K.MÃI"];
            [headerView.PromAccountValueLbl setText:[NSString stringWithFormat:@"%@ %@", account.amount, account.unit]];
        } else if ([account.name isEqualToString:@"TK DATA"]) {
            
            [headerView.DataAccountNameLbl setText:@"TK DATA"];
            [headerView.DataAccountValueLbl setText:[NSString stringWithFormat:@"%@ %@", account.amount, account.unit]];
        }
    }
    
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

#pragma mark - Screen
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    
    [self.tableView.tableHeaderView setNeedsUpdateConstraints];
    [self.tableView.tableHeaderView updateConstraintsIfNeeded];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
