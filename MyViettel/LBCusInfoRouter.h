//
//  LBCusInfoRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBRootRouter.h"
#import "LBCusInfoViewController.h"
#import "LBCusInfoPresenter.h"
#import "LBCustomer.h"
#import "LBShopListRouter.h"

@interface LBCusInfoRouter : NSObject

@property(nonatomic)LBRootRouter *rootRouter;
@property(nonatomic)LBCusInfoPresenter *cusInfoPresenter;
@property(nonatomic)LBShopListRouter *shopListRouter;


-(void)showCusInfoViewControllerFromViewController:(NSManagedObjectID *)customerObjectID fromViewController:(UIViewController*)fromVC;

-(void)dismissCusInfoViewController;

-(void)showShopListViewController;

@end
