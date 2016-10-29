//
//  LBHomeRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeRouter.h"

@implementation LBHomeRouter

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
        
    _homeViewController = [[LBHomeViewController alloc] init];
    
    return self;
}


-(void)setSlideMenuViewController:(LBSlideMenuViewController *)slideMenuViewController {
    
    _slideMenuViewController = slideMenuViewController;
    
    _slideMenuViewController.transitioningDelegate = _homeViewController;
    _slideMenuViewController.modalTransitionStyle = UIModalPresentationCustom;
    
    _homeViewController.slideMenuViewController = slideMenuViewController;
}

-(void)setHomePresenter:(LBHomePresenter *)homePresenter {
    
    _homePresenter = homePresenter;
    _homePresenter.homeVCDelegate = self.homeViewController;
    
    _homeViewController.presenterDelegate = homePresenter;
}

-(void)showHomeViewController {
    
    //[self.rootViewController.navigationController setNavigationBarHidden:YES];
    [self.rootViewController setViewControllersIntoNavController:@[self.homeViewController] animated:YES];
}

@end
