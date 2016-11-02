//
//  LBSlideMenuRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuRouter.h"
#import "LBSlideMenuChooseBackgroundTableViewController.h"


@interface LBSlideMenuRouter()

@property(nonatomic) LBSlideMenuViewController *slideMenuViewController;


@end

@implementation LBSlideMenuRouter

#pragma mark - Initializers


-(void)setSlideMenuPresenter:(LBSlideMenuPresenter *)slideMenuPresenter {
    
    _slideMenuPresenter = slideMenuPresenter;
    _slideMenuPresenter.slideMenuVCDelegate = self.slideMenuViewController;
    _slideMenuPresenter.slideMenuRouterDelegate = self;
    
    _slideMenuViewController.presenterDelegate = slideMenuPresenter;
}

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    _slideMenuViewController = [[LBSlideMenuViewController alloc] init];
    
    return self;
}


-(UINavigationController *)navigationController {
    
    if (_navigationController) return _navigationController;
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:self.slideMenuViewController];
    
    return _navigationController;
}


#pragma mark - LBSlideMenuRouterDelegate
-(void)showSlideMenuBackgroundSelectorVC {
    
    LBSlideMenuChooseBackgroundTableViewController *backgroundSelectorVC = [[LBSlideMenuChooseBackgroundTableViewController alloc] init];
    backgroundSelectorVC.presenterDelegate = self.slideMenuPresenter;
    
    [_slideMenuViewController.navigationController setNavigationBarHidden:NO];
    [_slideMenuViewController.navigationController pushViewController:backgroundSelectorVC animated:YES]; 
}

-(void)dismissSlideMenuBackgroundSelectorVC {
    
    [self.slideMenuViewController.navigationController popToRootViewControllerAnimated:NO];
}


@end
