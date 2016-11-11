//
//  LBCusInfoPresenter.m
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCusInfoPresenter.h"
#import "LBCusInfoRouter.h"
#import <MagicalRecord.h>

@interface LBCusInfoPresenter()

@property(nonatomic) NSMutableArray *jobMenuItems;
@property(nonatomic) LBCustomer *customer;


@end

@implementation LBCusInfoPresenter


#pragma mark - Initializers
-(void)setCustomerObjectID:(NSManagedObjectID *)customerObjectID {
    
    _customerObjectID = customerObjectID;
    
    //fetch customer object from persistent store
    if (customerObjectID) {
        _customer = [[NSManagedObjectContext MR_contextForCurrentThread] existingObjectWithID:customerObjectID error:nil];
    }
}


-(NSMutableArray *)jobMenuItems {
    
    if (_jobMenuItems) return _jobMenuItems;
    
    _jobMenuItems = [[NSMutableArray alloc] init];
    [_jobMenuItems addObjectsFromArray:@[@"Kế toán", @"Văn phòng", @"Lập trình", @"Bác sĩ", @"Kiến trúc sư xây dựng", @"Khác"]];
    
    return _jobMenuItems;
}


#pragma mark - LBCusInfoPresenterDelegate
-(void)getCusInfo {
    
    [self.cusInfoViewControllerDelegate gotCusInfo:_customer];
}

-(void)dismissCusInfoViewController {
    
    [self.cusInfoRouter dismissCusInfoViewController];
}

-(void)getJobMenuItems {
    
    [self.cusInfoViewControllerDelegate gotJobMenuItems:self.jobMenuItems];
}

-(void)updateCustomer:(void (^)(LBCustomer *))updateNewValueBlock {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
       
       LBCustomer *updatedCustomer = (LBCustomer*)[localContext existingObjectWithID:_customerObjectID error:nil];
        
        if (updateNewValueBlock) {
            
            updateNewValueBlock(updatedCustomer);
        }
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        
        if (contextDidSave) {
            NSLog(@"LBCustomer updated on database without errors");
            
            [self.cusInfoRouter dismissCusInfoViewController];
        } else {
            if (error) {
                NSLog(@"LBCustomer failed to update on database with Error %@, %s, %d", [error localizedDescription], __FUNCTION__, __LINE__);
            }
        }
    }];
}

-(void)showShopListViewController {
    
    [self.cusInfoRouter showShopListViewController];
}

@end
