//
//  LBCusInfoRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCusInfoRouter.h"

@interface LBCusInfoRouter()

@property(nonatomic)LBCusInfoViewController *cusInfoViewController;

@end

@implementation LBCusInfoRouter

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    _cusInfoViewController = [[LBCusInfoViewController alloc] init];
    
    return self;
}

-(void)setCusInfoPresenter:(LBCusInfoPresenter *)cusInfoPresenter {
    
    _cusInfoPresenter = cusInfoPresenter;
    _cusInfoPresenter.cusInfoViewControllerDelegate = _cusInfoViewController;
    
    _cusInfoViewController.cusInfoPresenterDelegate = cusInfoPresenter;
}


-(void)showCusInfoViewControllerFromViewController:(NSManagedObjectID *)customerObjectID fromViewController:(UIViewController *)fromVC {
    
    if (fromVC.navigationController) {
        
        [fromVC.navigationController pushViewController:_cusInfoViewController animated:YES];
    } else {
        
        [fromVC presentViewController:_cusInfoViewController animated:YES completion:nil];
    }
    
    _cusInfoPresenter.customerObjectID = customerObjectID;
}

-(void)dismissCusInfoViewController {
    
    if (_cusInfoViewController.navigationController) {
        
        [_cusInfoViewController.navigationController popViewControllerAnimated:YES];
    } else {
        
        [_cusInfoViewController dismissViewControllerAnimated:YES completion:nil];
    }

}

-(void)showShopListViewController {
    
    [self.shopListRouter showShopListViewController:_cusInfoViewController];
}

@end
