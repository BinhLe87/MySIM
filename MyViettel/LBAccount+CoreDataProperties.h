//
//  LBAccount+CoreDataProperties.h
//  MyViettel
//
//  Created by Le Van Binh on 10/21/16.
//  Copyright © 2016 LBComp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LBAccount.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBAccount (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *account_type;
@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSDate *expired_date;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *unit;
@property (nullable, nonatomic, retain) NSString *intro;
@property (nullable, nonatomic, retain) LBCustomer *customer;

@end

NS_ASSUME_NONNULL_END
