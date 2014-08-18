//
//  ModalSnappedViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 16.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "ModalSnappedViewController.h"

@interface ModalSnappedViewController ()
@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@end

@implementation ModalSnappedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.mainView snapToPoint:self.view.center];
    self.snapBehavior.damping = 0.8;
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.mainView addGestureRecognizer:self.panGestureRecognizer];

    [self.dynamicAnimator addBehavior:self.snapBehavior];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        [self.dynamicAnimator removeBehavior:_snapBehavior];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        CGPoint newCenter = self.mainView.center;
        newCenter.x += [recognizer translationInView:self.view].x;
        newCenter.y += [recognizer translationInView:self.view].y;
        
        self.mainView.center = newCenter;
        
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        [self.dynamicAnimator addBehavior:self.snapBehavior];
    }
}

- (void)unwindSelf:(id)sender
{
    [self.dynamicAnimator removeAllBehaviors];
    [super unwindSelf:sender];
}

@end
