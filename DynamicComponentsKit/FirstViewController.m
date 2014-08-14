//
//  FirstViewController.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ModalSegue"]) {
        UIViewController *controller = (UIViewController *)segue.destinationViewController;
        controller.modalPresentationStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = self;
    }
}

@end
