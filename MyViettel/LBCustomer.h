//
//  LBCustomer.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@class LBAccount, LBService;

NS_ASSUME_NONNULL_BEGIN

@interface LBCustomer : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+(LBCustomer*)getCustomerByPhone:(NSString*)phone;
+(void)fetchAccountsByTypeForPhone:(NSString*)phone accountType:(NSString*)accountType completionBlock:(void(^)(NSArray* results))completionBlock;

-(UIImage*)getBackgroundImg;

@end

NS_ASSUME_NONNULL_END

#import "LBCustomer+CoreDataProperties.h"
