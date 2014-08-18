//
//  DismissAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "DismissAnimator.h"

@implementation DismissAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = [toViewController topRootView];
    
    if ([fromViewController isKindOfClass:[ModalViewController class]]) {
        ModalViewController *modalFromViewController = (ModalViewController *)fromViewController;
        
        CGRect finalFrame = modalFromViewController.mainView.frame;
        CGFloat fromViewHeight = fromViewController.view.frame.size.height;
        finalFrame.origin.y = (modalFromViewController.dismissMode == DismissModeToBottom) ? fromViewHeight : -fromViewHeight;
        
        toView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
        [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            modalFromViewController.blurView.alpha = 0.0;
            modalFromViewController.mainView.frame = finalFrame;
        } completion:^(BOOL finished) {
            toView.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
