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
#import "LBHomeTableCellAutoLayout.h"
#import "LBHomeFooterSection.h"
#import "LBHomeHeaderSection.h"


@interface LBHomeViewController ()

@property(nonatomic)LBCustomer *_customerEntity;
@property(nonatomic)NSMutableArray *cus_accounts;
@property (nonatomic, strong) LBHomeTableCellAutoLayout *prototypeCell;

@end

int const sectionBackgroundColor = 0xFFFFFF;
int const tableViewBackgroundColor = 0xE3F1DA;
int const marginLeftSection = 8;
int const marginRightSection = 8;
int const spaceBetweenSections = 20;

@implementation LBHomeViewController
@synthesize _customerEntity = customerEntity;

-(LBHomeTableCellAutoLayout *)prototypeCell {
    
    if (_prototypeCell) return _prototypeCell;
    
    _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LBHomeTableCellAutoLayout class])];
    
    return _prototypeCell;
}


-(NSMutableArray *)cus_accounts {
    
    if (_cus_accounts) return _cus_accounts;
    
    _cus_accounts = [[NSMutableArray alloc] init];
    
    return _cus_accounts;
}

-(UITableView *)tableView {
    
    if(_tableView) return _tableView;
    
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: Initialize table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //set style
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setShowsVerticalScrollIndicator:NO];
    [_tableView setShowsHorizontalScrollIndicator:NO];
    _tableView.backgroundColor = UIColorFromRGB(tableViewBackgroundColor);
    
    
    //add headerView
    LBHomeHeaderView *headerView = [LBHomeHeaderView header];
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), [LBHomeHeaderView heightForHeaderView]);
    headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.tableHeaderView = headerView;
    
    //register class for tableCell
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LBHomeTableCellAutoLayout class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([LBHomeTableCellAutoLayout class])];
    
    [_tableView registerClass:[LBHomeHeaderSection class] forHeaderFooterViewReuseIdentifier:[LBHomeHeaderSection identifier]];
    
    [_tableView registerClass:[LBHomeFooterSection class] forHeaderFooterViewReuseIdentifier:[LBHomeFooterSection identifier]];
    
    //set self-sizing for cell
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = [LBHomeTableCellAutoLayout estimatedCellHeight];

    //TODO:Fill data into table view
    [self fillDataGUI];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
}


-(void)fillDataGUI {
    
    customerEntity = [self.presenterDelegate getCustomerInfo];
    [self.presenterDelegate getAccountsOfCustomer:^(NSArray *accounts) {
        
        for (LBAccount* account in accounts) {
            
            [self.cus_accounts addObject:account];
        }
    }];
    
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

-(void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), [LBHomeHeaderView heightForHeaderView]);
}


#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == HomeTableSectionTypeAccount) {
        
        return self.cus_accounts.count;
    } else if (section == HomeTableSectionTypeService) {
        
        return customerEntity.services.count;
    }
    
    return 0;
}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    LBHomeHeaderSection *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[LBHomeHeaderSection identifier]];
    
    headerView.tableSectionType = section;
    headerView.numRowsInSection = section == HomeTableSectionTypeService ? customerEntity.services.count : 0;
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return [LBHomeHeaderSection heightForHeaderSection];
}



-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    LBHomeFooterSection *footerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[LBHomeFooterSection identifier]];
    
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return [LBHomeFooterSection heightForFooterSection];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LBHomeTableCellAutoLayout class]) forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[LBHomeTableCellAutoLayout class]])
    {
        LBHomeTableCellAutoLayout *homeCell = (LBHomeTableCellAutoLayout*)cell;
        
        if (indexPath.section == HomeTableSectionTypeAccount) {
            
            LBAccount *account = [self.cus_accounts objectAtIndex:indexPath.row];
            [homeCell.rowAvatar setImage:[UIImage imageNamed:@"3gviettel.jpeg"]];
            [homeCell.rowTitle setText:account.name];
            [homeCell.rowContent setText:account.intro];
        } else if (indexPath.section == HomeTableSectionTypeService) {
            
            [homeCell.rowAvatar setImage:[UIImage imageNamed:@"3gviettel.jpeg"]];
            [homeCell.rowTitle setText:@"Test"];
            [homeCell.rowContent setText:@"Test Content"];
        }
    }
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    
    [self.prototypeCell setNeedsLayout];
    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height + 1;
}



@end
