//
//  LBMyViettelDependencies.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBSlideMenuRouter.h"
#import "LBHomeRouter.h"

@interface LBMyViettelDependencies : NSObject

@property(nonatomic) LBSlideMenuRouter *slideMenuRouter;
@property(nonatomic) LBHomeRouter *homeRouter;

@end
