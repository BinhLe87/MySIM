//
//  LBCustomer+CoreDataProperties.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LBCustomer.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBCustomer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *package_name;
@property (nullable, nonatomic, retain) NSSet<LBAccount *> *accounts;
@property (nullable, nonatomic, retain) NSSet<LBService *> *services;

@end

@interface LBCustomer (CoreDataGeneratedAccessors)

- (void)addAccountsObject:(LBAccount *)value;
- (void)removeAccountsObject:(LBAccount *)value;
- (void)addAccounts:(NSSet<LBAccount *> *)values;
- (void)removeAccounts:(NSSet<LBAccount *> *)values;

- (void)addServicesObject:(LBService *)value;
- (void)removeServicesObject:(LBService *)value;
- (void)addServices:(NSSet<LBService *> *)values;
- (void)removeServices:(NSSet<LBService *> *)values;

@end

NS_ASSUME_NONNULL_END
