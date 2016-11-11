//
//  LBShopInteractor.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopInteractor.h"

@implementation LBShopInteractor

-(NSArray *)getShopList {
    
   return [_shopListDataManagerDelegate getShopList];
}

@end
