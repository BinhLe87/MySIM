//
//  LBHomeInteractor.m
//  MyViettel
//
//  Created by Le Van Binh on 10/25/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeInteractor.h"


@implementation LBHomeInteractor

-(LBCustomer *)getCustomerByPhone:(NSString *)phone {
    
    return [self.homeDataManagerDelegate getCustomerByPhone:phone];
}

-(void)fetchAccountsByTypeForPhone:(NSString *)phone accountType:(NSString *)accountType completionBlock:(void (^)(NSArray *))completionBlock {
    
    [self.homeDataManagerDelegate fetchAccountsByTypeForPhone:phone accountType:accountType completionBlock:^(NSArray *results) {
       
        if (completionBlock) {
            
            completionBlock(results);
        }
    }];
}

@end
