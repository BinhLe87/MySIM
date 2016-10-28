//
//  LBMyViettelRootViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface LBMyViettelRootViewController : NSObject

@property(nonatomic) SlideNavigationController *navigationController;
@property(nonatomic) UIWindow *window;
@property(nonatomic) UIViewController *leftMenu;

-(void)setViewControllersIntoNavController:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated;

@end
