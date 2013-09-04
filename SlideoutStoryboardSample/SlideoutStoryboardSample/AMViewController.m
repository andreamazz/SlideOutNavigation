//
//  AMViewController.m
//  SlideoutStoryboardSample
//
//  Created by Andrea on 15/02/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMViewController.h"
#import "AMAppDelegate.h"
#import "AMSlideOutNavigationController.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (IBAction)actionBadge:(id)sender
{
	AMAppDelegate* delegate = [UIApplication sharedApplication].delegate;
	[delegate.slideoutController setBadgeValue:@":)" forTag:1];
}


@end
