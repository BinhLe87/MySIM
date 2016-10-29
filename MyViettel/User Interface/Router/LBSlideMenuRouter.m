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




#pragma mark - LBSlideMenuRouterDelegate
-(void)showSlideMenuBackgroundSelectorVC {
    
    LBSlideMenuChooseBackgroundTableViewController *backgroundSelectorVC = [[LBSlideMenuChooseBackgroundTableViewController alloc] init];
    backgroundSelectorVC.presenterDelegate = self.slideMenuPresenter;
    
    //[self.rootViewController.navigationController pushViewController:backgroundSelectorVC animated:YES];
    
    /*backgroundSelectorVC.modalPresentationStyle = UIModalPresentationFullScreen;
    backgroundSelectorVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.slideMenuViewController presentViewController:backgroundSelectorVC animated:YES completion:nil];*/
    
   
    
   
    
}

-(void)dismissSlideMenuBackgroundSelectorVC {
    
    [self.slideMenuViewController.navigationController popToRootViewControllerAnimated:YES];
}


@end
