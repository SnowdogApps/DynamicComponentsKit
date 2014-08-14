//
//  UIViewController+ModalTransitioningDelegate.m
//  ConferenceApp
//
//  Created by Radoslaw Szeja on 05.08.2014.
//  Copyright (c) 2014 Trail.pl. All rights reserved.
//

#import "UIViewController+ModalTransitioningDelegate.h"

@implementation UIViewController (ModalTransitioningDelegate)

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [[PresentAnimator alloc] initWithDuration:0.5];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissAnimator alloc] initWithDuration:0.4];
}

@end
