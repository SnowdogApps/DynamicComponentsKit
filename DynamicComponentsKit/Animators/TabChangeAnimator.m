//
//  TabChangeAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "TabChangeAnimator.h"

@implementation TabChangeAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    toViewController.view.alpha = 0.0;
    fromViewController.view.alpha = 1.0;
    
    [UIView animateWithDuration:self.duration animations:^{
        toViewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromViewController.view.alpha = 0.0;
        [transitionContext completeTransition:finished];
    }];
}

@end
