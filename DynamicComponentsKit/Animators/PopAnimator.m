//
//  PopAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "PopAnimator.h"

@implementation PopAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGPoint fromCenter = fromViewController.view.center;
    fromCenter.x += fromViewController.view.frame.size.width;
    
    CGPoint toCenter = toViewController.view.center;
    toViewController.view.center = CGPointMake(toCenter.x - 0.3*toViewController.view.frame.size.width, toCenter.y);
    toViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:self.duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromViewController.view.center = fromCenter;
        toViewController.view.center = toCenter;
        toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
//        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
