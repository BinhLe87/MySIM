//
//  LBShopListViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopListViewController.h"
#import "LBShopTableViewCell.h"
#import "LBShop.h"


@interface LBShopListViewController ()

@property(nonatomic) NSArray* shopArray;

@end

@implementation LBShopListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _shopArray = [[NSArray alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    

    [_tableView registerClass:[LBShopTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LBShopTableViewCell class])];
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LBShopTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([LBShopTableViewCell class])];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = [LBShopTableViewCell estimatedHeight];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [_tableView setShowsHorizontalScrollIndicator:NO];
    [_tableView setShowsVerticalScrollIndicator:NO];
    
    
    [_shopListPresenterDelegate getShopList];
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _shopArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LBShopTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LBShopTableViewCell class]) forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[LBShopTableViewCell class]])
    {
        LBShopTableViewCell *shopCell = (LBShopTableViewCell*)cell;
        
        LBShop *shop = [_shopArray objectAtIndex:indexPath.row];
        
        shopCell.shopNameLbl.text = shop.name;
        shopCell.shopAddressLbl.text = shop.address;
        shopCell.shopDistanceLbl.text = @"1000 km";
    }
}

#pragma mark - LBShopListViewControllerDelegate
-(void)gotShopList:(NSArray *)shopList {
    
    _shopArray = shopList;
}

@end
