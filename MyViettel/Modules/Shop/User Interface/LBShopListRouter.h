//
//  LBShopListRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBShop.h"

@class LBShopListPresenter;

@interface LBShopListRouter : NSObject


@property(nonatomic)LBShopListPresenter *shopListPresenter;

-(void)showShopListViewController:(UIViewController*)fromViewController;
-(void)showShopMapViewControllerWithShop:(LBShop*)shop;

@end
