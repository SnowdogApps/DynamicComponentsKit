//
//  ShadowView.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.masksToBounds = NO;
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.2;
}

@end
