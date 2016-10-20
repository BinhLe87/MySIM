//
//  LBServiceDetails+CoreDataProperties.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LBServiceDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBServiceDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *service_id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) LBService *service;

@end

NS_ASSUME_NONNULL_END
