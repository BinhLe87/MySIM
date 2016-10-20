//
//  LBSlideMenuRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuRouter.h"
#import "LBSlideMenuChooseBackgroundTableViewController.h"


@implementation LBSlideMenuRouter

#pragma mark - Initializers


-(void)showSlideMenuViewController {
    
    [self.rootViewController setViewControllersIntoNavController:@[_slideMenuViewController] animated:NO];
}

#pragma mark - LBSlideMenuRouterDelegate
-(void)showSlideMenuBackgroundSelectorVC {
    
    LBSlideMenuChooseBackgroundTableViewController *backgroundSelectorVC = [[LBSlideMenuChooseBackgroundTableViewController alloc] init];
    backgroundSelectorVC.slideMenuViewController = _slideMenuViewController;
    
    [self.slideMenuViewController.navigationController pushViewController:backgroundSelectorVC animated:YES];
}

-(void)dismissSlideMenuBackgroundSelectorVC {
    
    [self.slideMenuViewController.navigationController popToRootViewControllerAnimated:YES];
}

@end
