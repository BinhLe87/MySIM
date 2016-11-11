//
//  LBMyViettelDependencies.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBMyViettelDependencies.h"
//Data store
#import "LBDataStoreManager.h"
#import "LBCoreDataManager.h"
//RootViewController
#import "LBRootRouter.h"
//Slide menu
#import "LBSlideMenuPresenter.h"
//HomeView
#import "LBHomeRouter.h"
#import "LBHomePresenter.h"
#import "LBHomeInteractor.h"
//CusInfo
#import "LBCusInfoRouter.h"
#import "LBCusInfoPresenter.h"
//Shop
#import "LBShopListRouter.h"
#import "LBShopListPresenter.h"
#import "LBShopInteractor.h"



@implementation LBMyViettelDependencies {
    
    LBDataStoreManager *dataStoreManager;
}

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    [self configureDependencies];
    
    return self;
}

-(void)configureDependencies {
    
    LBRootRouter *rootRouter = [[LBRootRouter alloc] init];
    dataStoreManager = [[LBCoreDataManager alloc] init];
    
    
    //TODO: Slide menu - add dependencies
    LBSlideMenuPresenter *slideMenuPresenter = [[LBSlideMenuPresenter alloc] init];
    _slideMenuRouter = [[LBSlideMenuRouter alloc] init];
    
    slideMenuPresenter.slideMenuRouterDelegate = _slideMenuRouter;
    _slideMenuRouter.slideMenuPresenter = slideMenuPresenter;
    _slideMenuRouter.rootRouter = rootRouter;
    
    
    //TODO: HomeView - add dependencies
    LBHomePresenter *homePresenter = [[LBHomePresenter alloc] init];
    LBHomeInteractor *homeInteractor = [[LBHomeInteractor alloc] init];
    
    homeInteractor.homeDataManagerDelegate = dataStoreManager;
    homePresenter.homeInteractor = homeInteractor;
    _homeRouter = [[LBHomeRouter alloc] init];
    _homeRouter.rootRouter = rootRouter;
    _homeRouter.homePresenter = homePresenter;
    _homeRouter.slideMenuRouter = _slideMenuRouter;
    homePresenter.homeRouterDelegate = _homeRouter;
    [_homeRouter setupViewTransitions];
    
    slideMenuPresenter.homePresenterDelegate = homePresenter;
    
    //TODO: CusInfo - add dependencies
    LBCusInfoRouter *cusInfoRouter = [[LBCusInfoRouter alloc] init];
    LBCusInfoPresenter *cusInfoPresenter = [[LBCusInfoPresenter alloc] init];
    
    cusInfoPresenter.cusInfoRouter = cusInfoRouter;
    cusInfoRouter.cusInfoPresenter = cusInfoPresenter;
    
    
    _homeRouter.cusInfoRouter = cusInfoRouter;
    
    //TODO: ShopList - add dependencies
    LBShopListRouter *shopListRouter = [[LBShopListRouter alloc] init];
    LBShopListPresenter *shopListPresenter = [[LBShopListPresenter alloc] init];
    LBShopInteractor *shopInteractor = [[LBShopInteractor alloc] init];
    
    shopListPresenter.shopInteractor = shopInteractor;
    shopListRouter.shopListPresenter = shopListPresenter;
    shopInteractor.shopListDataManagerDelegate = dataStoreManager;
    
    cusInfoRouter.shopListRouter = shopListRouter;
}

@end
