//
//  LBDataStoreManager.h
//  MyViettel
//
//  Created by Le Van Binh on 10/31/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBHomeInterface.h"
#import "LBShopListInterface.h"

@class LBCustomer;
@interface LBDataStoreManager : NSObject  <LBHomeDataManagerDelegate, LBShopListDataManagerDelegate>


@end
