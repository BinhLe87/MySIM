//
//  LBHomeRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeRouter.h"

@implementation LBHomeRouter

-(void)showHomeViewController {
    
    [self.rootViewController.navigationController setNavigationBarHidden:YES];
    [self.rootViewController setViewControllersIntoNavController:@[_homeViewController] animated:YES];
}

@end
