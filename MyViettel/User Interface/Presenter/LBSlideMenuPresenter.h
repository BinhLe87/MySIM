//
//  SlideMenuPresenter.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBSlideMenuInterface.h"
#import "LBSlideMenuViewController.h"
#import "LBCustomer.h"
#import "LBHomeInterface.h"

@interface LBSlideMenuPresenter : NSObject <LBSlideMenuPresenterDelegate>

@property(nonatomic) NSArray* menuTableViewCells;
@property(nonatomic) id <LBSlideMenuViewControllerDelegate> slideMenuVCDelegate;
@property(nonatomic) id <LBSlideMenuRouterDelegate> slideMenuRouterDelegate;
@property(nonatomic) id <LBHomePresenterDelegate> homePresenterDelegate;


@end
