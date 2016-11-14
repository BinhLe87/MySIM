//
//  LBShopListPresenter.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBShopListInterface.h"
#import "LBShopInteractor.h"
#import "LBShopListRouter.h"


@interface LBShopListPresenter : NSObject <LBShopListPresenterDelegate>

@property(nonatomic, weak) id<LBShopListViewControllerDelegate> shopListVCDelegate;
@property(nonatomic)LBShopInteractor *shopInteractor;
@property(nonatomic)LBShopListRouter *shopListRouter;

@end
