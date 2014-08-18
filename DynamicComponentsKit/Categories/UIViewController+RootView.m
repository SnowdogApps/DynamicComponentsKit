//
//  RootView.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "UIViewController+RootView.h"

@implementation UIViewController (RootView)

- (UIView *)topRootView
{
    if (self.tabBarController != nil) {
        return self.tabBarController.view;
    } else if (self.navigationController != nil) {
        return self.navigationController.view;
    } else {
        return self.view;
    }
}

@end
