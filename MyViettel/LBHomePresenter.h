//
//  LBHomePresenter.h
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBHomeInterface.h"
#import "LBHomeInteractor.h"



@interface LBHomePresenter : NSObject <LBHomePresenterDelegate>

@property(nonatomic, weak) id<LBHomeViewControllerDelegate> homeVCDelegate;
@property(nonatomic) LBHomeInteractor *homeInteractor;
@property(nonatomic, weak) id<LBHomeRouterDelegate> homeRouterDelegate;

@end
