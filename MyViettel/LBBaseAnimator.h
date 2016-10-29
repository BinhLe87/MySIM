//
//  LBBaseAnimator.h
//  MyViettel
//
//  Created by Le Van Binh on 10/28/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ModalAnimatedTransitioningType) {
    ModalAnimatedTransitioningTypePresent,
    ModalAnimatedTransitioningTypeDismiss
};


@interface LBBaseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property(nonatomic) ModalAnimatedTransitioningType transitionType;

- (void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC;
- (void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC;


@end
