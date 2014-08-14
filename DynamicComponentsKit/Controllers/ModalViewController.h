//
//  ModalViewController.h
//  DynamicKit
//
//  Created by Radoslaw Szeja on 13.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "BaseViewController.h"

@interface ModalViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UIVisualEffectView *blurView;
@property (nonatomic, weak) IBOutlet UIView *mainView;
@end
