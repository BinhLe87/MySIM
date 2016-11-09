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

-(void)gotCustomerInfo:(LBCustomer*)customer;
-(void)gotAccountsOfCustomer:(NSArray *)accounts;
-(void)updateBackgroundImage:(UIImage *)backgroundImg;

@end

@protocol LBHomePresenterDelegate <NSObject>

-(void)getCustomerInfo;
-(void)getAccountsOfCustomer;
-(void)showCusInfoViewController;
-(void)presentSlideMenuViewController;
-(void)updateBackgroundImage:(UIImage *)backgroundImg;


@end


@protocol LBHomeRouterDelegate <NSObject>

-(void)showCusInfoViewController:(NSManagedObjectID*)customerObjectID;
-(void)presentSlideMenuViewController;
@end


@protocol LBHomeDataManagerDelegate <NSObject>

@required
-(LBCustomer*)getCustomerByPhone:(NSString*)phone;
-(void)fetchAccountsByTypeForPhone:(NSString*)phone accountType:(NSString*)accountType completionBlock:(void(^)(NSArray* results))completionBlock;

@end
