//
//  PushAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "PushAnimator.h"

@implementation PushAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    CGPoint finalToCenter = toViewController.view.center;
    toViewController.view.center = CGPointMake(1.5*toViewController.view.frame.size.width, finalToCenter.y);
    
    CGPoint origFromCenter = fromViewController.view.center;
    CGPoint fromCenter = CGPointMake(origFromCenter.x - 0.3*fromViewController.view.frame.size.width, origFromCenter.y);
    
    //usingSpringWithDamping:0.8 initialSpringVelocity:1.0
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toViewController.view.center = finalToCenter;
        fromViewController.view.center = fromCenter;
        fromViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:finished];
    }];
}

@end
