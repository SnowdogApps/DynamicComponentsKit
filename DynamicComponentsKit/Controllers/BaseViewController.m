//
//  BaseViewController.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransitionController;
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopGesture:)];
    recognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:recognizer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.navigationController != nil) {
        self.navigationController.delegate = self;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

@end
