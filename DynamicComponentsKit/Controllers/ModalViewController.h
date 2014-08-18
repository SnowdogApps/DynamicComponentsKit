//
//  ModalViewController.h
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, PresentationMode) {
    PresentationModeFromBottom = 0,
    PresentationModeFromTop
};

typedef NS_ENUM(NSInteger, DismissMode) {
    DismissModeToBottom = 0,
    DismissModeToTop
};

@interface ModalViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UIView *blurView;
@property (nonatomic, weak) IBOutlet UIView *mainView;
@property (nonatomic) PresentationMode presentationMode;
@property (nonatomic) DismissMode dismissMode;
@end
