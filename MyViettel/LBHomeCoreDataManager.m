//
//  LBHomeDataManager.m
//  MyViettel
//
//  Created by Le Van Binh on 10/25/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeCoreDataManager.h"
#import "LBCustomer.h"

@interface LBHomeCoreDataManager()

@property(nonatomic) LBCustomer *customerEntity;

@end

@implementation LBHomeCoreDataManager

#pragma mark - Initializers
-(LBCustomer *)customerEntity {
    
    if (_customerEntity) return _customerEntity;
    
    _customerEntity = [[LBCustomer alloc] init];
    
    return _customerEntity;
}

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
