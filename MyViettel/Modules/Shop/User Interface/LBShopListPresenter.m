//
//  LBShopListPresenter.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopListPresenter.h"
#import "LBShopListRouter.h"

@implementation LBShopListPresenter {
    
    NSArray *shopList;
}

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    shopList = [[NSArray alloc] init];
        
    return self;
}


#pragma mark - LBShopListPresenterDelegate
-(void)getShopList {
    
    shopList = [self.shopInteractor getShopList];
    
    [_shopListVCDelegate gotShopList:shopList];
}

@end
