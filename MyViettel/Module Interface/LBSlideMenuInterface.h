//
//  SlideMenuInterface.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBCustomer.h"

@interface LBSlideMenuInterface : NSObject

@end


@protocol LBSlideMenuPresenterDelegate <NSObject>

-(void)getData;
-(void)showBackgroundSelectorVC;
-(void)didSelectBackgroundImage:(UIImage*)selectedBackgroundImg;

@end


@protocol LBSlideMenuViewControllerDelegate <NSObject>

-(void)showData:(LBCustomer*)customer menuItemArray:(NSArray *)menuItemArray;
-(void)updateBackgroundImage:(UIImage*)backgroundImage;
@end


@protocol LBSlideMenuRouterDelegate <NSObject>

-(void)showSlideMenuBackgroundSelectorVC;
-(void)dismissSlideMenuBackgroundSelectorVC;

@end



