//
//  UIViewController+NavigationInteractivePopGesture.m
//  MgriOS
//
//  Created by Radoslaw Szeja on 12.08.2014.
//
//

#import "UIViewController+NavigationInteractivePopGesture.h"

@implementation UIViewController (NavigationInteractivePopGesture)
@dynamic interactivePopTransitionController;

- (IBAction)handlePopGesture:(UIScreenEdgePanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    NSLog(@"progress: %lf", progress);
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactivePopTransitionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactivePopTransitionController updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.3) {
            [self.interactivePopTransitionController finishInteractiveTransition];
        }
        else {
            [self.interactivePopTransitionController cancelInteractiveTransition];
        }
    }
}

@end
