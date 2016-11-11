//
//  LBShopListViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBShopListInterface.h"

@interface LBShopListViewController : UIViewController <LBShopListViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) UITableView *tableView;
@property(nonatomic,weak) id<LBShopListPresenterDelegate> shopListPresenterDelegate;

@end
