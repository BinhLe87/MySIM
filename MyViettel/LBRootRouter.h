//
//  LBMyViettelRootViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LBRootRouter : NSObject

@property(nonatomic) UINavigationController *navigationController;
@property(nonatomic) UIWindow *window;



-(void)setViewControllersIntoNavController:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated;

@end
