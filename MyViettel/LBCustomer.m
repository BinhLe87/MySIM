//
//  LBCustomer.m
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCustomer.h"
#import "LBAccount.h"
#import "LBService.h"
#import <MagicalRecord.h>

@implementation LBCustomer

// Insert code here to add functionality to your managed object subclass
-(LBCustomer*)getCustomerByPhone:(NSString*)phone {
    
    NSPredicate *findByPhone = [NSPredicate predicateWithFormat:@"phone = %@", phone];
    
    return [LBCustomer MR_findFirstWithPredicate:findByPhone];
}

@end
