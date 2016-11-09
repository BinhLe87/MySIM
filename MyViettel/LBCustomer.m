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
#import "SDImageCache.h"

@implementation LBCustomer

// Insert code here to add functionality to your managed object subclass
+(LBCustomer*)getCustomerByPhone:(NSString*)phone {
    
    NSPredicate *findByPhone = [NSPredicate predicateWithFormat:@"phone = %@", phone];
    
    return [LBCustomer MR_findFirstWithPredicate:findByPhone];
}

+(void)fetchAccountsByTypeForPhone:(NSString *)phone accountType:(NSString *)accountType completionBlock:(void (^)(NSArray * results))completionBlock {
    
    NSPredicate *findByPhone = [NSPredicate predicateWithFormat:@"phone = %@", phone];
    LBCustomer *foundCustomer = [LBCustomer MR_findFirstWithPredicate:findByPhone];
    
    NSPredicate *filterByAccountType = [NSPredicate predicateWithFormat:@"customer = %@ AND account_type = %@", foundCustomer, accountType];
    
    NSArray *resultsInBkgThread = [LBAccount MR_findAllWithPredicate:filterByAccountType];
    
    //return to main thread
    __block NSArray *resultsInMainThread;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", resultsInBkgThread];
        
        resultsInMainThread = [LBAccount MR_findAllWithPredicate:mainPredicate];
        
        if(completionBlock) {
            
            completionBlock(resultsInMainThread);
        }
    });
}

-(UIImage *)getBackgroundImg {
    
    UIImage *bkgImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.backgroundImg];
    
    if (!bkgImg) { //set default background image
        
        bkgImg = [UIImage imageNamed:LB_DEFAULT_BACKGROUND];
    }
    
    return bkgImg;
}


@end
