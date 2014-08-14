//
//  NavigationBaseViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "NavigationBaseViewController.h"

@interface NavigationBaseViewController ()
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransitionController;
@end

@implementation NavigationBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopGesture:)];
    recognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:recognizer];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[PopAnimator class]]) {
        return self.interactivePopTransitionController;
    }
    
    return nil;
}

@end
