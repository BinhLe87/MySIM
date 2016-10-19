//
//  LBMyViettelDependencies.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBMyViettelDependencies.h"
//Slide menu
#import "LBSlideMenuViewController.h"
#import "LBSlideMenuPresenter.h"



@implementation LBMyViettelDependencies

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    [self configureDependencies];
    
    return self;
}

-(void)configureDependencies {
    
    //TODO: Slide menu - add dependencies
    LBSlideMenuViewController *slideMenuViewController = [[LBSlideMenuViewController alloc] init];
    LBSlideMenuPresenter *slideMenuPresenter = [[LBSlideMenuPresenter alloc] init];
    _slideMenuRouter = [[LBSlideMenuRouter alloc] init];
    
    
    slideMenuViewController.presenterDelegate = slideMenuPresenter;
    slideMenuPresenter.slideMenuVCDelegate = slideMenuViewController;
    slideMenuPresenter.slideMenuRouterDelegate = _slideMenuRouter;
    _slideMenuRouter.slideMenuPresenter = slideMenuPresenter;
    _slideMenuRouter.slideMenuViewController = slideMenuViewController;
}

@end
