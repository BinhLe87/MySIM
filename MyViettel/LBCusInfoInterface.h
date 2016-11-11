//
//  LBCusInfoInterface.h
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCustomer.h"

@protocol LBCusInfoViewControllerDelegate <NSObject>

-(void)gotCusInfo:(LBCustomer *)customer;
-(void)gotJobMenuItems:(NSMutableArray *)jobs;

@end


@protocol LBCusInfoPresenterDelegate <NSObject>

-(void)getCusInfo;
-(void)dismissCusInfoViewController;
-(void)getJobMenuItems;
-(void)updateCustomer:(void(^)(LBCustomer *updatedCustomer))updateNewValueBlock;

@end




