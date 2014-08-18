//
//  TableViewController.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 17.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ModalViewController *controller = nil;

    if ([segue.destinationViewController isKindOfClass:[ModalViewController class]]) {
        controller = (ModalViewController *)segue.destinationViewController;
        controller.modalPresentationStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = self;
        
        if ([segue.identifier isEqualToString:@"FromTopToTopSegue"]) {
            controller.presentationMode = PresentationModeFromTop;
            controller.dismissMode = DismissModeToTop;
        } else if ([segue.identifier isEqualToString:@"FromBottomToBottomSegue"]) {
            controller.presentationMode = PresentationModeFromBottom ;
            controller.dismissMode = DismissModeToBottom;
        } else if ([segue.identifier isEqualToString:@"FromBottomToTopSegue"]) {
            controller.presentationMode = PresentationModeFromBottom;
            controller.dismissMode = DismissModeToTop;
        } else if ([segue.identifier isEqualToString:@"FromTopToBottomSegue"]) {
            controller.presentationMode = PresentationModeFromTop;
            controller.dismissMode = DismissModeToBottom;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
