//
//  LBHomeRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeRouter.h"

@implementation LBHomeRouter


-(LBHomeViewController *)homeViewController {
    
    if (_homeViewController) return _homeViewController;
    
    _homeViewController = [[LBHomeViewController alloc] init];
    
    _homeViewController.presenterDelegate = self.homePresenter;
    
    return _homeViewController;
}

-(void)setHomePresenter:(LBHomePresenter *)homePresenter {
    
    _homePresenter = homePresenter;
    _homePresenter.homeVCDelegate = self.homeViewController;
}

-(void)showHomeViewController {
    
    //[self.rootViewController.navigationController setNavigationBarHidden:YES];
    [self.rootViewController setViewControllersIntoNavController:@[self.homeViewController] animated:YES];
}

@end
