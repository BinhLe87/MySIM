//
//  LBSlideLeftAnimator.m
//  MyViettel
//
//  Created by Le Van Binh on 10/28/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideLeftAnimator.h"
#import <Masonry.h>

@implementation FakeImageView

+(instancetype)createSnapshotForViewController:(UIViewController *)viewController {
    
    UIGraphicsBeginImageContextWithOptions(viewController.view.bounds.size, YES, 0);
    [viewController.view drawViewHierarchyInRect:viewController.view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [[FakeImageView alloc] initWithImage:image];
}

@end


static NSTimeInterval kAnimationDuration = 0.5f;

@implementation LBSlideLeftAnimator


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return kAnimationDuration;
}

-(void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC {
    
    CGRect toVCRect = toVC.view.frame;
    CGRect toVCRectStart = toVCRect;
    
    toVCRectStart.origin.x = -toVCRect.size.width;
    
    toVC.view.frame = toVCRectStart;
    
    FakeImageView *fakeImageView = [FakeImageView createSnapshotForViewController:fromVC];
    fakeImageView.frame = [UIScreen mainScreen].bounds;
    fakeImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    fakeImageView.alpha = 0.6;
    
    UIView *container = [transitionContext containerView];

    [container addSubview:fakeImageView];
    [container addSubview:fromVC.view];
    [container addSubview:toVC.view];

    [UIView animateWithDuration:kAnimationDuration animations:^{
        
        CGRect toVCRectEnd = toVC.view.frame;
        toVCRectEnd.origin.x = 0.f;
        toVC.view.frame = toVCRectEnd;
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            
            [transitionContext completeTransition:NO];
        } else  {
            
            [transitionContext completeTransition:YES];
        }
    }];
    
}



-(void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC {
    
    CGRect fromVCRect = fromVC.view.frame;
    CGRect fromVCRectEnd = fromVCRect;
    fromVCRectEnd.origin.x = -fromVCRect.size.width;
    
    UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];
    [container addSubview:fromVC.view];
    toVC.view.alpha = 0.6;
    
    [container.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj isKindOfClass:[FakeImageView class]]) {
            
            [obj removeFromSuperview];
        }
    }];
    
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        
        fromVC.view.frame = fromVCRectEnd;
        toVC.view.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            
            [transitionContext completeTransition:NO];
        } else  {
        
            [transitionContext completeTransition:YES];
        }
    }];
    
}



@end
