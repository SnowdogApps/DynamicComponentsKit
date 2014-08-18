//
//  UIViewController+NavigationInteractivePopGesture.h
//  MgriOS
//
//  Created by Radoslaw Szeja on 12.08.2014.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController (NavigationInteractivePopGesture)
@property (nonatomic, getter=isInteractive) BOOL interactive;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransitionController;

- (IBAction)handlePopGesture:(UIScreenEdgePanGestureRecognizer *)recognizer;

@end
