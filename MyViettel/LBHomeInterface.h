//
//  LBHomeInterface.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCustomer.h"

@protocol LBHomeViewControllerDelegate <NSObject>


@end

@protocol LBHomePresenterDelegate <NSObject>

-(LBCustomer*)getCustomerInfo;

@end
