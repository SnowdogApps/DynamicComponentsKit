//
//  ContainerWithShadow.m
//  DynamicComponentsKit
//
//  Created by Radoslaw Szeja on 14.08.2014.
//  Copyright (c) 2014 Radoslaw Szeja. All rights reserved.
//

#import "ContainerWithShadow.h"

@implementation ContainerWithShadow

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 13;
    self.layer.masksToBounds = NO;
    
}

@end
