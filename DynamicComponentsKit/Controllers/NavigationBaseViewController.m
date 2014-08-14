//
//  NavigationBaseViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "NavigationBaseViewController.h"

@interface NavigationBaseViewController ()

@end

@implementation NavigationBaseViewController

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[PopAnimator class]]) {
        self.interactivePopTransitionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        return self.interactivePopTransitionController;
    }
    
    return nil;
}

@end
