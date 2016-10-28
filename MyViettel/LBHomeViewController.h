//
//  HomeViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBHomeInterface.h"
#import "SlideNavigationController.h"

typedef NS_ENUM(NSUInteger, HomeTableSectionType) {
    
    HomeTableSectionTypeAccount = 0,
    HomeTableSectionTypeService = 1
};

extern int const sectionBackgroundColor;
extern int const marginLeftSection;
extern int const marginRightSection;
extern int const spaceBetweenSections;
extern int const tableViewBackgroundColor;

@interface LBHomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SlideNavigationControllerDelegate, LBHomeViewControllerDelegate>

@property(nonatomic) UITableView *tableView;
@property(nonatomic) id<LBHomePresenterDelegate> presenterDelegate;

@end
