//
//  AppDelegate.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    UIColor *color = [UIColor colorWithRed:0.0 green:200/255.0 blue:230.0/255.0 alpha:1.0];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: color} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: color} forState:UIControlStateHighlighted];
    
    [[UITabBar appearance] setTintColor:color];
}

@end
