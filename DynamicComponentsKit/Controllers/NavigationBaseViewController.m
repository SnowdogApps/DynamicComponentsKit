//
//  NavigationBaseViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "NavigationBaseViewController.h"

@interface NavigationBaseViewController ()
@property (nonatomic, getter=isInteractive) BOOL interactive;
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
    if (self.isInteractive && [animationController isKindOfClass:[PopAnimator class]]) {
        self.interactivePopTransitionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        return self.interactivePopTransitionController;
    }
    
    return nil;
}

@end
