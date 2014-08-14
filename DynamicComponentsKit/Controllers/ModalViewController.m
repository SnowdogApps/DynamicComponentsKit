//
//  ModalViewController.m
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (IBAction)unwindSelf:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
