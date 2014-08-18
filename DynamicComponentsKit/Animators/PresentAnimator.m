//
//  PresentAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "PresentAnimator.h"

@implementation PresentAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    if ([toViewController isKindOfClass:[ModalViewController class]]) {
        ModalViewController *modalToViewController = (ModalViewController *)toViewController;
        
        UIView *fromView = [fromViewController topRootView];
        
        CGFloat blurAlpha = modalToViewController.blurView.alpha;
        modalToViewController.blurView.alpha = 0.0;
        
        CGPoint finalCenter = modalToViewController.mainView.center;
        CGRect initialFrame = modalToViewController.mainView.frame;
        initialFrame.origin.y = (modalToViewController.presentationMode == PresentationModeFromBottom) ? fromView.frame.size.height : -fromView.frame.size.height;
        modalToViewController.mainView.frame = initialFrame;
        
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            modalToViewController.blurView.alpha = blurAlpha;
            modalToViewController.mainView.center = finalCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }
}

@end
