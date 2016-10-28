//
//  LBMyViettelDependencies.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBMyViettelDependencies.h"
//RootViewController
#import "LBMyViettelRootViewController.h"
//Slide menu
#import "LBSlideMenuPresenter.h"
//HomeView
#import "LBHomeRouter.h"
#import "LBHomePresenter.h"
#import "LBHomeInteractor.h"
#import "LBHomeCoreDataManager.h"



@implementation LBMyViettelDependencies

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    [self configureDependencies];
    
    return self;
}

-(void)configureDependencies {
    
    LBMyViettelRootViewController *rootViewController = [[LBMyViettelRootViewController alloc] init];
    
    //TODO: Slide menu - add dependencies

    LBSlideMenuPresenter *slideMenuPresenter = [[LBSlideMenuPresenter alloc] init];
    _slideMenuRouter = [[LBSlideMenuRouter alloc] init];
    

    slideMenuPresenter.slideMenuRouterDelegate = _slideMenuRouter;
    _slideMenuRouter.slideMenuPresenter = slideMenuPresenter;
    _slideMenuRouter.rootViewController = rootViewController;
    [_slideMenuRouter setAsLeftMenu];
    
    //TODO: HomeView - add dependencies
    LBHomePresenter *homePresenter = [[LBHomePresenter alloc] init];
    LBHomeInteractor *homeInteractor = [[LBHomeInteractor alloc] init];
    LBHomeCoreDataManager *homeCoreDateManager = [[LBHomeCoreDataManager alloc] init];
    
    homeInteractor.homeDataManagerDelegate = homeCoreDateManager;
    homePresenter.homeInteractor = homeInteractor;
    _homeRouter = [[LBHomeRouter alloc] init];
    _homeRouter.rootViewController = rootViewController;
    _homeRouter.homePresenter = homePresenter;
}

@end
