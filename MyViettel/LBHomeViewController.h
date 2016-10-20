//
//  HomeViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBHomeInterface.h"

@interface LBHomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) UITableView *tableView;
@property(nonatomic) id<LBHomePresenterDelegate> presenterDelegate;

@end
