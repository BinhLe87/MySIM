//
//  LBHomeRouter.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBHomeViewController.h"
#import "LBMyViettelRootViewController.h"
#import "LBHomePresenter.h"

@interface LBHomeRouter : NSObject

@property(nonatomic)LBHomeViewController *homeViewController;
@property(nonatomic)LBMyViettelRootViewController *rootViewController;

@property(nonatomic) LBHomePresenter *homePresenter;

-(void)showHomeViewController;

@end
