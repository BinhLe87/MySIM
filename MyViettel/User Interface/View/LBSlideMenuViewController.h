//
//  SlideMenuViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSlideMenuInterface.h"

@interface LBSlideMenuViewController : UIViewController <LBSlideMenuViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>


@property(nonatomic) UITableView *tableView;
@property(nonatomic) NSArray *menuItems;
@property(nonatomic) id<LBSlideMenuPresenterDelegate> presenterDelegate;

@end
