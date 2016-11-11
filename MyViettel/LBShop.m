//
//  LBShop.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShop.h"
#import <MagicalRecord.h>

@implementation LBShop

// Insert code here to add functionality to your managed object subclass
+(NSArray *)getShopList {
    
   return  [LBShop MR_findAll];
}


@end
