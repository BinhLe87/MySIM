//
//  LBMyViettelRootViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBRootRouter.h"

@implementation LBRootRouter

-(UIWindow *)window {
    
    if (_window) return _window;
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [_window makeKeyAndVisible];
    
    return _window;
}



-(float) statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}

-(UINavigationController *)navigationController {
    
    if (_navigationController) return _navigationController;
    
    _navigationController = [[UINavigationController alloc] init];
    
    self.window.rootViewController = _navigationController;
    
    return _navigationController;
}

-(void)setViewControllersIntoNavController:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    
    [self.navigationController setViewControllers:viewControllers animated:animated];
}   


@end
