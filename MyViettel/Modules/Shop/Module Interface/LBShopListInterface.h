//
//  LBShopListInterface.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShop.h"

@protocol LBShopListPresenterDelegate <NSObject>

-(void)getShopList;
-(void)didSelectShop:(LBShop*)selectedShop;
@end


@protocol LBShopListViewControllerDelegate <NSObject>

-(void)gotShopList:(NSArray*)shopList;

@end


@protocol LBShopListDataManagerDelegate <NSObject>

-(NSArray*)getShopList;


@end

