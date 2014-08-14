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
        
        UIView *fromView = [self parentViewInController:fromViewController];
        
        CGFloat blurAlpha = modalToViewController.blurView.alpha;
        modalToViewController.blurView.alpha = 0.0;
        
        CGPoint mainViewCenter = modalToViewController.mainView.center;
        modalToViewController.mainView.center = CGPointMake(mainViewCenter.x, mainViewCenter.y - modalToViewController.mainView.frame.size.height);
        
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            modalToViewController.blurView.alpha = blurAlpha;
            modalToViewController.mainView.center = mainViewCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }
}

@end
