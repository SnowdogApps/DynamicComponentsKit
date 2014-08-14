//
//  UIViewController+NavigationTransitionDelegate.m
//  MgriOS
//
//  Created by Radoslaw Szeja on 12.08.2014.
//
//

#import "UIViewController+NavigationTransitionDelegate.h"

@implementation UIViewController (NavigationTransitionDelegate)

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return [[PopAnimator alloc] initWithDuration:0.35];
    } else if (operation == UINavigationControllerOperationPush) {
        return [[PushAnimator alloc] initWithDuration:0.35];
    }
    
    return nil;
}

@end
