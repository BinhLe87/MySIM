//
//  LBViewInteractive.h
//  MyViettel
//
//  Created by Le Van Binh on 10/28/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PanGesTureType) {
    
    PanGesTureTypeBasic,
    PanGesTureTypeScreenEdge
};


@interface LBViewInteractive : UIPercentDrivenInteractiveTransition

@property(nonatomic) UIViewController *presentingViewController;
@property(nonatomic) UIViewController *presentedViewController;
@property(nonatomic) UIPanGestureRecognizer *panGesture;


-(void)attachToViewController:(UIViewController*)presentingViewController withView:(UIView*)view presentedViewController:(UIViewController*)presentedViewController panGestureType:(PanGesTureType)panGestureType;


@end
