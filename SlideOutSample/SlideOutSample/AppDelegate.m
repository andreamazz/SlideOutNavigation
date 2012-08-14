//
//  AppDelegate.m
//  SlideOutSample
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AppDelegate.h"
#import "AMSlideOutNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	
	UIViewController* controller;
	
	// First Section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	
	NSMutableDictionary* item1 = [[NSMutableDictionary alloc] init];
	[item1 setObject:@"First View" forKey:kSOViewTitle];
	[item1 setObject:controller forKey:kSOController];
	[item1 setObject:@"icon1.png" forKey:kSOViewIcon];
	
	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	
	NSMutableDictionary* item2 = [[NSMutableDictionary alloc] init];
	[item2 setObject:@"Second View" forKey:kSOViewTitle];
	[item2 setObject:controller forKey:kSOController];
	[item2 setObject:@"icon2.png" forKey:kSOViewIcon];
	
	NSArray *controllers = [[NSArray alloc] initWithObjects:item1, item2, nil];
	
	NSDictionary* section1 = [NSDictionary dictionaryWithObjectsAndKeys:controllers, kSOSection, @"First Section", kSOSectionTitle, nil];
	
	
	// Second Section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	
	NSMutableDictionary* item3 = [[NSMutableDictionary alloc] init];
	[item3 setObject:@"First View" forKey:kSOViewTitle];
	[item3 setObject:controller forKey:kSOController];
	[item3 setObject:@"icon1.png" forKey:kSOViewIcon];
	
	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	
	NSMutableDictionary* item4 = [[NSMutableDictionary alloc] init];
	[item4 setObject:@"Second View" forKey:kSOViewTitle];
	[item4 setObject:controller forKey:kSOController];
	[item4 setObject:@"" forKey:kSOViewIcon];
	
	controllers = [[NSArray alloc] initWithObjects:item3, item4, nil];
	
	NSDictionary* section2 = [NSDictionary dictionaryWithObjectsAndKeys:controllers, kSOSection, @"Second Section", kSOSectionTitle, nil];
	
	
	// Items displayed
	NSArray* items = [NSArray arrayWithObjects:section1, section2, nil];
	
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigationWithMenuItems:items];
	[self.window setRootViewController:self.slideoutController];
	
    [self.window makeKeyAndVisible];
    return YES;
}

@end
