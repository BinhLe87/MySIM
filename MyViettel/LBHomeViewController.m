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
#import "LBCenterBarItemView.h"



@interface LBHomeViewController ()

@property(nonatomic)LBCustomer *_customerEntity;
@property(nonatomic)NSMutableArray *cus_accounts;
@property (nonatomic, strong) LBHomeTableCellAutoLayout *prototypeCell;
@property(nonatomic)LBCenterBarItemView *_navbarCenterView;

@end

int const sectionBackgroundColor = 0xFFFFFF;
int const tableViewBackgroundColor = 0xE3F1DA;
int const marginLeftSection = 8;
int const marginRightSection = 8;
int const spaceBetweenSections = 20;

@implementation LBHomeViewController
@synthesize _customerEntity = customerEntity;
@synthesize _navbarCenterView = navbarCenterView;

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


#pragma mark - viewController handler
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: Initialize table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
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
    
    UITapGestureRecognizer *tapGestureOnAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnAvatar:)];
    tapGestureOnAvatar.numberOfTapsRequired = 1;
    tapGestureOnAvatar.numberOfTouchesRequired = 1;
    [headerView.cusAvatarImageView addGestureRecognizer:tapGestureOnAvatar];
    
    //register class for tableCell
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LBHomeTableCellAutoLayout class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([LBHomeTableCellAutoLayout class])];
    
    [_tableView registerClass:[LBHomeHeaderSection class] forHeaderFooterViewReuseIdentifier:[LBHomeHeaderSection identifier]];
    
    [_tableView registerClass:[LBHomeFooterSection class] forHeaderFooterViewReuseIdentifier:[LBHomeFooterSection identifier]];
    
    //set self-sizing for cell
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = [LBHomeTableCellAutoLayout estimatedCellHeight];
    
    _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    _tableView.estimatedSectionHeaderHeight = [LBHomeHeaderSection heightForHeaderSection];
    
    _tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    _tableView.estimatedSectionFooterHeight = [LBHomeFooterSection heightForFooterSection];
    
    //TODO:Fill data into table view
    [self fillDataGUI];
    
    
    //TODO: add center navigationBarItem
    navbarCenterView = [[LBCenterBarItemView alloc] init];
    navbarCenterView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.navigationItem.titleView = navbarCenterView;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
    //TODO: add left navigationBarItem
    UIImage *menuButtomImage = [UIImage imageNamed:@"menu-button.png"];
    UIBarButtonItem *leftbarButtomItem = [[UIBarButtonItem alloc] initWithImage:menuButtomImage style:UIBarButtonItemStylePlain target:self action:(@selector(tapOnMenuButtomItem:))];
    self.navigationItem.leftBarButtonItem = leftbarButtomItem;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
}


-(void)fillDataGUI {
    
    [self.presenterDelegate getCustomerInfo];
    [self.presenterDelegate getAccountsOfCustomer];
    
    LBHomeHeaderView *headerView = (LBHomeHeaderView*)self.tableView.tableHeaderView;
    
    [headerView.cusNameLbl setText:customerEntity.name];
    [headerView.CusInfoLbl setText:[NSString stringWithFormat:@"%@ | %@", customerEntity.phone, customerEntity.package_name]];
    [headerView.cusAvatarImageView sd_setImageWithURL:[NSURL URLWithString:customerEntity.avatar_link] placeholderImage:[UIImage imageNamed:LB_DEFAULT_AVATAR]];
    
    [headerView.backgroundImageView setImage:customerEntity.getBackgroundImg];
    
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

-(void)viewWillAppear:(BOOL)animated {
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

-(void)viewDidLayoutSubviews {
    
    self.navigationController.view.frame = [UIScreen mainScreen].bounds;
    self.view.frame = [UIScreen mainScreen].bounds;
    
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), [LBHomeHeaderView heightForHeaderView]);
    
    //determine the frame of leftBarButtonItem on navigation bar
    UIBarButtonItem *leftBarButtonItem = self.navigationItem.leftBarButtonItem;
    UIView *leftBarButtonItemView = [leftBarButtonItem valueForKey:@"view"];
    CGFloat leftBarButtonItemwidth;
    if(leftBarButtonItemView){
        leftBarButtonItemwidth=[leftBarButtonItemView frame].size.width;
    }
    else{
        leftBarButtonItemwidth=(CGFloat)0.0 ;
    }
    
    
    navbarCenterView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - leftBarButtonItemwidth, CGRectGetHeight(self.navigationController.navigationBar.frame));
    
    [navbarCenterView setNeedsUpdateConstraints];
    [navbarCenterView updateConstraintsIfNeeded];
}


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
}

-(void)tapOnMenuButtomItem:(id)sender {
    
    [self.presenterDelegate presentSlideMenuViewController];
}


-(void)tapOnAvatar:(UITapGestureRecognizer*)gesture {
    
    [self.presenterDelegate showCusInfoViewController];
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


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    LBHomeFooterSection *footerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[LBHomeFooterSection identifier]];
    
    return footerView;
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    
    [self.prototypeCell setNeedsLayout];
    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
}

/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.dateTimePopover8 setPermittedArrowDirections:UIPopoverArrowDirectionUnknown];
    
    
    LBSlideMenuViewController *destNav = _slideMenuViewController;
    _slideMenuViewController.preferredContentSize = CGSizeMake(280,200);
    destNav.modalPresentationStyle = UIModalPresentationPopover;
    
    
    
    
    _dateTimePopover8 = destNav.popoverPresentationController;
    _dateTimePopover8.delegate = self;
    _dateTimePopover8.sourceView = self.view;
    
    CGRect rectCellInTableView = [self.tableView rectForRowAtIndexPath:indexPath];
    CGRect rectCellInSuperView = [self.tableView convertRect:rectCellInTableView toView:self.view];
    
    CGRect frame = rectCellInSuperView;
    frame.origin.y = frame.origin.y+20;
    _dateTimePopover8.sourceRect = frame;
    //destNav.navigationBarHidden = YES;
    [self presentViewController:destNav animated:YES completion:nil];
}
 
 */

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}

#pragma mark - LBHomeViewControllerDelegate
-(void)gotCustomerInfo:(LBCustomer *)customer {
    
    customerEntity = customer;
}

-(void)gotAccountsOfCustomer:(NSArray *)accounts {
    
    for (LBAccount* account in accounts) {
        
        [self.cus_accounts addObject:account];
    }
}


-(void)updateBackgroundImage:(UIImage *)backgroundImg {
    
    LBHomeHeaderView *headerView = (LBHomeHeaderView*)self.tableView.tableHeaderView;
    [headerView.backgroundImageView setImage:backgroundImg];
}





@end
