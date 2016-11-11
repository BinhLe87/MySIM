//
//  LBViewInteractive.m
//  MyViettel
//
//  Created by Le Van Binh on 10/28/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBViewInteractive.h"

static int LB_SCREEN_OFFSET = 60;
@interface LBViewInteractive()

@property(nonatomic) BOOL shouldComplete;
@property(nonatomic) PanGesTureType panGestureType;

@end

@implementation LBViewInteractive

-(void)attachToViewController:(UIViewController *)presentingViewController withView:(UIView *)view presentedViewController:(UIViewController *)presentedViewController panGestureType:(PanGesTureType)panGestureType {
    
    self.presentingViewController = presentingViewController;
    self.presentedViewController = presentedViewController;
    
    switch (panGestureType) {
        case PanGesTureTypeBasic:
            self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)];
            break;
            
        case PanGesTureTypeScreenEdge:
            self.panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)];
            break;
            
        default:
            self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)];
            break;
    }
    
    [view addGestureRecognizer:self.panGesture];
}



-(void)onPanGesture:(UIScreenEdgePanGestureRecognizer *)pan {
    
    CGPoint panTranslation = [pan translationInView:pan.view.superview];
    BOOL allowToPresentVC = YES;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            if (self.presentedViewController) {
                
                if (self.presentingViewController.presentedViewController) {
                    
                    if ([self.presentingViewController.presentedViewController isKindOfClass:[self.presentedViewController class]]) {
                        
                        allowToPresentVC = NO;
                    }
                }
                
                if (allowToPresentVC) {
                                            
                    [self.presentingViewController presentViewController:self.presentedViewController animated:YES completion:nil];
                }
            } else {
                
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            const CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width - LB_SCREEN_OFFSET;
            const CGFloat DragAmount = self.presentedViewController ? screenWidth : -screenWidth;
            const CGFloat Threshold = .3f;
            CGFloat percent = panTranslation.x / DragAmount;
            
            percent = fmaxf(percent, 0.f);
            percent = fminf(percent, 1.f);
            
            [self updateInteractiveTransition:percent + 0.3];
            
            self.shouldComplete = percent > Threshold;
            
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
            if (!self.shouldComplete) {
                
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        {
            if (pan.state == UIGestureRecognizerStateCancelled || !self.shouldComplete) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
        }
            break;
            
        default:
            break;
    }
}

-(CGFloat)completionSpeed {
    
    return 1.f - self.percentComplete;
}

@end
