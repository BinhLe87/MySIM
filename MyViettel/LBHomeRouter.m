//
//  LBHomeRouter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeRouter.h"
#import "LBHomeViewController.h"
#import "LBViewInteractive.h"
#import "LBSlideLeftAnimator.h"

@interface LBHomeRouter() <UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate>

@property(nonatomic) LBHomeViewController *homeViewController;
@property(nonatomic) LBViewInteractive *presentInteractor;
@property(nonatomic) LBViewInteractive *dismissInteractor;
@property(nonatomic) BOOL disableInteractivePlayerTransitioning;

@end

@implementation LBHomeRouter

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
        
    _homeViewController = [[LBHomeViewController alloc] init];
    
    return self;
}


-(void)setHomePresenter:(LBHomePresenter *)homePresenter {
    
    _homePresenter = homePresenter;
    _homePresenter.homeVCDelegate = self.homeViewController;
    
    _homeViewController.presenterDelegate = homePresenter;
}

-(void)showHomeViewController {
    
    [self.rootRouter setViewControllersIntoNavController:@[self.homeViewController] animated:YES];
    

}

-(void)setupViewTransitions {
    
    //TODO: set transition style for presented view controller (SlideMenuViewController)
    self.slideMenuRouter.navigationController.transitioningDelegate = self;
    self.slideMenuRouter.navigationController.modalTransitionStyle = UIModalPresentationCustom;
    
    self.disableInteractivePlayerTransitioning = NO;
    self.presentInteractor = [[LBViewInteractive alloc] init];
    [self.presentInteractor attachToViewController:_homeViewController withView:_homeViewController.view presentedViewController:self.slideMenuRouter.navigationController panGestureType:PanGesTureTypeBasic];
    
    self.dismissInteractor = [[LBViewInteractive alloc] init];
    [self.dismissInteractor attachToViewController:self.slideMenuRouter.navigationController withView:self.slideMenuRouter.navigationController.view presentedViewController:nil panGestureType:PanGesTureTypeBasic];
}


#pragma mark - LBHomeRouterDelegate
-(void)showCusInfoViewController:(NSManagedObjectID *)customerObjectID {
    
    [self.cusInfoRouter showCusInfoViewControllerFromViewController:customerObjectID fromViewController:_homeViewController];
}

-(void)presentSlideMenuViewController {
    
    [self.homeViewController presentViewController:self.slideMenuRouter.navigationController animated:YES completion:nil];
    [_presentInteractor finishInteractiveTransition];

}


#pragma mark - UIViewControllerTransitioningDelegate
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    LBSlideLeftAnimator *animator = [[LBSlideLeftAnimator alloc] init];
    animator.transitionType = ModalAnimatedTransitioningTypePresent;
    
    return animator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    LBSlideLeftAnimator *animator = [[LBSlideLeftAnimator alloc] init];
    animator.transitionType = ModalAnimatedTransitioningTypeDismiss;
    
    return animator;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    if (!self.disableInteractivePlayerTransitioning) {
    
        return self.presentInteractor;
    }
    
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    if (!self.disableInteractivePlayerTransitioning) {
        
        return self.dismissInteractor;
    }
    
    return nil;
}


@end
