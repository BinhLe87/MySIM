//
//  LBShopListRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopListRouter.h"
#import "LBShopListPresenter.h"
#import "LBShopListViewController.h"
#import "LBShopMapViewController.h"

@interface LBShopListRouter()

@property(nonatomic) LBShopListViewController *shopListVC;
@property(nonatomic) LBShopMapViewController *shopMapVC;

@end

@implementation LBShopListRouter

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    _shopListVC = [[LBShopListViewController alloc] init];
    _shopMapVC = [[LBShopMapViewController alloc] init];
    
    return self;
}


-(void)setShopListPresenter:(LBShopListPresenter *)shopListPresenter {
    
    _shopListPresenter = shopListPresenter;
    _shopListPresenter.shopListVCDelegate = self.shopListVC;
    
    _shopListVC.shopListPresenterDelegate = shopListPresenter;
}

-(void)showShopListViewController:(UIViewController *)fromViewController {
    
    if (fromViewController.navigationController) {
        
        [fromViewController.navigationController pushViewController:_shopListVC animated:YES];
    } else {
        
        [fromViewController presentViewController:_shopListVC animated:YES completion:nil];
    }
}


-(void)showShopMapViewControllerWithShop:(LBShop *)shop {

    _shopMapVC.shop = shop;
    [_shopListVC.navigationController pushViewController:_shopMapVC animated:YES];
}


@end
