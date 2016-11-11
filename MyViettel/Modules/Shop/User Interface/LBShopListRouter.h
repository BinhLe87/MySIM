//
//  LBShopListRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBShopListPresenter.h"

@interface LBShopListRouter : NSObject


@property(nonatomic)LBShopListPresenter *shopListPresenter;

-(void)showShopListViewController:(UIViewController*)fromViewController;


@end
