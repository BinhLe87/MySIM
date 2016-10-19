//
//  LBMyViettelRootViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBMyViettelRootViewController.h"

@implementation LBMyViettelRootViewController

-(UIWindow *)window {
    
    if (_window) return _window;
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [_window makeKeyAndVisible];
    
    return _window;
}

-(UINavigationController *)navigationController {
    
    if (_navigationController) return _navigationController;
    
    _navigationController = [[SlideNavigationController alloc] init];
    
    self.window.rootViewController = _navigationController;
    
    return _navigationController;
}

-(void)setViewControllersIntoNavController:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    
    [self.navigationController setViewControllers:viewControllers animated:animated];
}


@end
