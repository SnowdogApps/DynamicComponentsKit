//
//  NavigationAnimator.h
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UIViewController+RootView.h"

@interface NavigationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGFloat duration;
@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;

- (instancetype)initWithDuration:(CGFloat)duration;

@end
