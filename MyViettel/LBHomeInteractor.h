//
//  LBHomeInteractor.h
//  MyViettel
//
//  Created by Le Van Binh on 10/25/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCustomer.h"
#import "LBHomeInterface.h"

@interface LBHomeInteractor : NSObject

@property(nonatomic) id<LBHomeDataManagerDelegate> homeDataManagerDelegate;

-(LBCustomer*)getCustomerByPhone:(NSString*)phone;
-(void)fetchAccountsByTypeForPhone:(NSString *)phone accountType:(NSString *)accountType completionBlock:(void (^)(NSArray *))completionBlock;

@end
