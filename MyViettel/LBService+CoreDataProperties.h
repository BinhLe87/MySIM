//
//  LBService+CoreDataProperties.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LBService.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBService (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSSet<LBServiceDetails *> *service_details;
@property (nullable, nonatomic, retain) NSSet<LBCustomer *> *customers;

@end

@interface LBService (CoreDataGeneratedAccessors)

- (void)addService_detailsObject:(LBServiceDetails *)value;
- (void)removeService_detailsObject:(LBServiceDetails *)value;
- (void)addService_details:(NSSet<LBServiceDetails *> *)values;
- (void)removeService_details:(NSSet<LBServiceDetails *> *)values;

- (void)addCustomersObject:(LBCustomer *)value;
- (void)removeCustomersObject:(LBCustomer *)value;
- (void)addCustomers:(NSSet<LBCustomer *> *)values;
- (void)removeCustomers:(NSSet<LBCustomer *> *)values;

@end

NS_ASSUME_NONNULL_END
