//
//  LBShopListInterface.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//


@protocol LBShopListPresenterDelegate <NSObject>

-(void)getShopList;

@end


@protocol LBShopListViewControllerDelegate <NSObject>

-(void)gotShopList:(NSArray*)shopList;

@end


@protocol LBShopListDataManagerDelegate <NSObject>

-(NSArray*)getShopList;

@end

