//
//  LBBaseAnimator.m
//  MyViettel
//
//  Created by Le Van Binh on 10/28/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBBaseAnimator.h"
#import "MustOverride.h"

@implementation LBBaseAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (self.transitionType == ModalAnimatedTransitioningTypePresent) {
        [self animatePresentingInContext:transitionContext toVC:to fromVC:from];
    } else if (self.transitionType == ModalAnimatedTransitioningTypeDismiss) {
        [self animateDismissingInContext:transitionContext toVC:to fromVC:from];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    mustOverride();
}

- (void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    SUBCLASS_MUST_OVERRIDE;
}

- (void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    SUBCLASS_MUST_OVERRIDE;
}

@end
