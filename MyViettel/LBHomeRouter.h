//
//  LBHomeRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LBRootRouter.h"
#import "LBHomePresenter.h"
#import "LBHomeInterface.h"
#import "LBSlideMenuRouter.h"
#import "LBCusInfoRouter.h"

@interface LBHomeRouter : NSObject <LBHomeRouterDelegate>

@property(nonatomic) LBRootRouter *rootRouter;
@property(nonatomic) LBHomePresenter *homePresenter;
@property(nonatomic) LBSlideMenuRouter *slideMenuRouter;
@property(nonatomic) LBCusInfoRouter *cusInfoRouter;


-(void)setupViewTransitions;
-(void)showHomeViewController;

@end
