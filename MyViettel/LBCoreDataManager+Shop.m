//
//  LBCoreDataManager+Shop.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCoreDataManager+Shop.h"
#import "LBShop.h"

@implementation LBCoreDataManager(Shop)

#pragma mark - LBShopListDataManagerDelegate
-(NSArray *)getShopList {
    
    return [LBShop getShopList];
}

@end
