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

	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];
	
	[self.slideoutController addSectionWithTitle:@"Section One"];
	
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"Second View" andIcon:@"icon2.png"];

	[self.slideoutController addSectionWithTitle:@"Section Two"];
	
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"First View" andIcon:@"icon1.png"];
	
	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"Second View" andIcon:@"icon2.png"];
	
	[self.window setRootViewController:self.slideoutController];
	
    [self.window makeKeyAndVisible];
    return YES;
}

@end
