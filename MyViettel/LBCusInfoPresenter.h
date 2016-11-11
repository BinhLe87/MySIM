//
//  LBCusInfoPresenter.h
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCusInfoInterface.h"
#import "LBCustomer.h"

@class LBCusInfoRouter;

@interface LBCusInfoPresenter : NSObject <LBCusInfoPresenterDelegate>

@property(nonatomic,weak) id<LBCusInfoViewControllerDelegate> cusInfoViewControllerDelegate;
@property(nonatomic) LBCusInfoRouter *cusInfoRouter;

@property(nonatomic) NSManagedObjectID *customerObjectID;


@end
