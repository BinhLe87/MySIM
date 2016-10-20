//
//  LBHomePresenter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomePresenter.h"
#import "LBCustomer.h"

@interface LBHomePresenter()

@property(nonatomic) LBCustomer *customerEntity;

@end

@implementation LBHomePresenter

-(instancetype)init {
    
    if(!(self = [super init])) return nil;
    
    _cus_phone = @"0977073999";
    
    return self;
}

#pragma mark - Initializers
-(LBCustomer *)customerEntity {
    
    if(_customerEntity) return _customerEntity;
    
    _customerEntity = [[LBCustomer alloc] init];
    
    return _customerEntity;
}

#pragma mark - LBHomePresenterDelegate
-(LBCustomer *)getCustomerInfo{
    
   return [self.customerEntity getCustomerByPhone:self.cus_phone];
}

@end
