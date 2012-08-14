AMSlideOutNavigationController
==================

SlideOut Navigation Controller for iOS.
This controller replicates the behaviour of the 'slide-out' navigation of applications like Facebook or Steam.
The project currently mimics FB's app styling, you can change all the table colors in the ```AMSlideOutGlobals.h```
ARC only.

Part of the code is based off [this blog post made by Nick Harris](http://nickharris.wordpress.com/2012/02/05/ios-slide-out-navigation-code/)

Screenshot
--------------------
![SlideOutNavigation](http://www.eflatgames.com/github/AMSlideOut.png)

Setup
--------------------
* Add the ```AMSlideOut``` folder to your project
* Link against ```QuartzCore``` framework
* Import ```AMSlideOutNavigationController.h``` in your AppDelegate
* Init ```AMSlideOutNavigationController```  using the data structure as follows.

Init data
--------------------
The ViewControllers presented by the SlideOut navigation are arranged in sections and rows of a UITableView.
You need to init the controller passing an array of sections. Each section item is a dictionary, containing the section title and an array describing the ViewControllers. Each item of this array is a dictionary containing the title, 44x44 icon (if present) and the reference to the ViewController. Check out the sample code to better understand how to setup your views.

Sample
--------------------
	UIViewController* controller;
	
	// First controller
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	
	NSMutableDictionary* item1 = [[NSMutableDictionary alloc] init];
	[item1 setObject:@"First View" forKey:kSOViewTitle];
	[item1 setObject:controller forKey:kSOController];
	[item1 setObject:@"icon1.png" forKey:kSOViewIcon];
	
	// Second controller
	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	
	NSMutableDictionary* item2 = [[NSMutableDictionary alloc] init];
	[item2 setObject:@"Second View" forKey:kSOViewTitle];
	[item2 setObject:controller forKey:kSOController];
	[item2 setObject:@"icon2.png" forKey:kSOViewIcon];
	
	NSArray *controllers = [[NSArray alloc] initWithObjects:item1, item2, nil];

	// First Section	
	NSDictionary* section1 = [NSDictionary dictionaryWithObjectsAndKeys:controllers, kSOSection, @"First Section", kSOSectionTitle, nil];
	
	// Items collection
	NSArray* items = [NSArray arrayWithObjects:section1, nil];

	self.slideoutController = [AMSlideOutNavigationController slideOutNavigationWithMenuItems:items];
	[self.window setRootViewController:self.slideoutController];

MIT License
--------------------
	Copyright (c) 2012 Andrea Mazzini. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.