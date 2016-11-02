//
//  LBHomeDataManager.m
//  MyViettel
//
//  Created by Le Van Binh on 10/25/16.
//  Copyright © 2016 LBComp. All rights reserved.
//


#import "LBCoreDataManager+Customer.h"


@implementation LBCoreDataManager(Customer)

#pragma mark - LBHomeDataManagerDelegate
-(LBCustomer *)getCustomerByPhone:(NSString *)phone {
    
    return [LBCustomer getCustomerByPhone:phone];
}

-(void)fetchAccountsByTypeForPhone:(NSString *)phone accountType:(NSString *)accountType completionBlock:(void (^)(NSArray *))completionBlock {
    
    [LBCustomer fetchAccountsByTypeForPhone:phone accountType:accountType completionBlock:^(NSArray * _Nonnull results) {
       
        completionBlock(results);
    }];
}


@end
