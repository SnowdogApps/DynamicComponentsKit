//
//  NavigationBaseViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "NavigationBaseViewController.h"

@interface NavigationBaseViewController ()
<<<<<<< HEAD
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransitionController;
=======
@property (nonatomic, getter=isInteractive) BOOL interactive;
>>>>>>> develop
@end

@implementation NavigationBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
=======
    
>>>>>>> develop
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopGesture:)];
    recognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:recognizer];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
<<<<<<< HEAD
    if ([animationController isKindOfClass:[PopAnimator class]]) {
=======
    if (self.isInteractive && [animationController isKindOfClass:[PopAnimator class]]) {
        self.interactivePopTransitionController = [[UIPercentDrivenInteractiveTransition alloc] init];
>>>>>>> develop
        return self.interactivePopTransitionController;
    }
    
    return nil;
}

@end
