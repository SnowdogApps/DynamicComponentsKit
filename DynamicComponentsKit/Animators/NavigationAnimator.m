//
//  NavigationAnimator.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "NavigationAnimator.h"

@implementation NavigationAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.duration = 0.25;
    }
    return self;
}

- (instancetype)initWithDuration:(CGFloat)duration
{
    self = [super init];
    if (self) {
        if (duration > 0.0) {
            self.duration = duration;
        } else {
            self.duration = 0.25;
        }
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSAssert(NO, @"-animateTranstion: not implemented");
}

@end
