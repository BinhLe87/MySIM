//
//  LBHomePresenter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomePresenter.h"
#import "LBCustomer.h"
#import "LBAccount.h"

@interface LBHomePresenter()

@property(nonatomic) LBCustomer *_customer;

@end

@implementation LBHomePresenter
@synthesize _customer = customer;

-(instancetype)init {
    
    if(!(self = [super init])) return nil;
    
    return self;
}

#pragma mark - Initializers


#pragma mark - LBHomePresenterDelegate
-(void)getCustomerInfo{
    
    customer = [self.homeInteractor getCustomerByPhone:extern_cus_phone];
    
    if (customer) {
        
        //cache into NSUseDefaults
        NSMutableDictionary *cusInfoDic = [[NSMutableDictionary alloc] init];
        
        [cusInfoDic setObject:customer.phone forKey:@"cus_phone"];
        [cusInfoDic setObject:customer.avatar_link forKey:@"avatar_link"];
        [cusInfoDic setObject:customer.name forKey:@"cus_name"];
        [UserDefaults setObject:cusInfoDic forKey:UserDefaultsKey(KEYS_CUS_INFO(extern_cus_phone))];
        
        //fetch backgroundImg from cache
        NSDictionary *cachedCusInfo = [UserDefaults dictionaryForKey:KEYS_CUS_INFO(extern_cus_phone)];
        [customer setBackgroundImg:[cachedCusInfo objectForKey:@"backgroundImg"]];
    
        
        [customer.accounts enumerateObjectsUsingBlock:^(LBAccount * _Nonnull obj, BOOL * _Nonnull stop) {
           
            NSLog(@"%@", obj.name);
        }];
        
    }
    
    
    
    
    [self.homeVCDelegate gotCustomerInfo:customer];
}

-(void)getAccountsOfCustomer {
    
    [self.homeInteractor fetchAccountsByTypeForPhone:extern_cus_phone accountType:@"DATA" completionBlock:^(NSArray *results) {
        
        [self.homeVCDelegate gotAccountsOfCustomer:results];
    }];
}

-(void)presentSlideMenuViewController {
    
    [self.homeRouterDelegate presentSlideMenuViewController];
}

-(void)showCusInfoViewController {
    
    [self.homeRouterDelegate showCusInfoViewController:customer.objectID];
}

-(void)updateBackgroundImage:(UIImage *)backgroundImg {
    
    [self.homeVCDelegate updateBackgroundImage:backgroundImg];
}

@end
