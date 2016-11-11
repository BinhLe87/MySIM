//
//  LBShopInteractor.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBShopListInterface.h"

@interface LBShopInteractor : NSObject

@property(nonatomic,weak) id<LBShopListDataManagerDelegate> shopListDataManagerDelegate;

-(NSArray*)getShopList;


@end
