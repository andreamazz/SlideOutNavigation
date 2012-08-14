SlideOutNavigation
==================

SlideOut Navigation Controller for iOS.
This controller replicates the behaviour of the 'slide-out' navigation of applications like Facebook or Steam.

Part of the code is based off [this blog post made by Nick Harris](http://nickharris.wordpress.com/2012/02/05/ios-slide-out-navigation-code/)

Screenshot
--------------------
![SlideOutNavigation](http://www.eflatgames.com/github/AMSlideOut.png)

Setup
--------------------
* Add the ```AMSlideOut``` folder to your project
* Link against ```QuartzCore``` framework
* Import ```AMSlideOutNavigationController.h``` in your AppDelegate
* Init ```AMSlideOutNavigationController```  using the following data structure.

Init data
--------------------
The ViewControllers presented by the SlideOut navigation are arranged in sections and rows of a table.
You need to init the controller passing an array of sections. Each section item is a dictionary, containing the section title and an array describing the ViewControllers. Each item of this array is a dictionary containing the title, icon (if present) and the reference to the ViewController.

Sample
--------------------
	UIViewController* controller;
	
	// Section
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
	
	// Items displayed
	NSArray* items = [NSArray arrayWithObjects:section1, nil];

	self.slideoutController = [AMSlideOutNavigationController slideOutNavigationWithMenuItems:items];
	[self.window setRootViewController:self.slideoutController];
