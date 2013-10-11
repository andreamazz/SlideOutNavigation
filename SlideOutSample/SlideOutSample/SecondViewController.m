//
//  SecondViewController.m
//  SlideOutSample
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (IBAction)badge1:(id)sender
{
	[((AppDelegate*)[[UIApplication sharedApplication] delegate]) setBadgeValue:@"1" forTag:1];
}

- (IBAction)badge2:(id)sender
{
	[((AppDelegate*)[[UIApplication sharedApplication] delegate]) setBadgeValue:@"1" forTag:2];
}

- (IBAction)badge3:(id)sender
{
	[((AppDelegate*)[[UIApplication sharedApplication] delegate]) setBadgeValue:@"50" forTag:3];
}

- (IBAction)badge4:(id)sender
{
	[((AppDelegate*)[[UIApplication sharedApplication] delegate]) setBadgeValue:@"!!!" forTag:4];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
