//
//  LBSlideMenuRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBSlideMenuPresenter.h"
#import "LBSlideMenuViewController.h"
#import "LBMyViettelRootViewController.h"

@interface LBSlideMenuRouter : NSObject <LBSlideMenuRouterDelegate>

@property(nonatomic) LBSlideMenuPresenter *slideMenuPresenter;
@property(nonatomic) LBSlideMenuViewController *slideMenuViewController;
@property(nonatomic) LBMyViettelRootViewController *rootViewController;


-(void)setAsLeftMenu;

@end
