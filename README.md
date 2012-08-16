AMSlideOutNavigationController
==================

SlideOut Navigation Controller for iOS.
This controller replicates the behaviour of the 'slide-out' navigation of applications like Facebook or Steam.
The project currently mimics FB's app styling, you can change all the table colors in the ```AMSlideOutGlobals.h```. 
ARC only.

Part of the code is based off [this blog post made by Nick Harris](http://nickharris.wordpress.com/2012/02/05/ios-slide-out-navigation-code/)

Screenshot
--------------------
![SlideOutNavigation](http://www.eflatgames.com/github/AMSlideOut1508.png)

Setup
--------------------
* Add the ```AMSlideOut``` folder to your project
* Link against ```QuartzCore``` framework
* Import ```AMSlideOutNavigationController.h``` in your AppDelegate
* Init ```AMSlideOutNavigationController```  using the data structure as follows.

Init data
--------------------
The ViewControllers presented by the SlideOut navigation are arranged in sections and rows of a UITableView.

You can use the following helper methods to setup your views:

* ```addSectionWithTitle:``` to add a section
* ```addViewControllerToLastSection:tagged:withTitle:andIcon:``` to add a viewcontroller to the last section
* ```addViewController:tagged:withTitle:andIcon:toSection:``` to add a viewcontroller to a specific section

To create a new section:

	// Note: Leave the title blank to hide the section header
	[self.slideoutController addSectionWithTitle:@"Section"];

To create a new row:

	[self.slideoutController addViewControllerToLastSection:controller		// Your UIViewController
													 tagged:1				// Used to change the object's properties, i.e. the badge
												  withTitle:@"First View"	
													andIcon:@"icon1.png"];	// 44x44 icon held in the project's resources

The main data structure is an array of sections. Each section item is a dictionary, containing the section title and an array describing the ViewControllers. Each item of this array is a dictionary containing the title, icon's file name, a numeric tag and the reference to the ViewController. 
You can also pass the complete data structure to the init method, but it's not recommended. 
Check out the sample to understand how these methods work.

Sample
--------------------
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];

	// Add a first section
	[self.slideoutController addSectionWithTitle:@"Section One"];

	// Add two viewcontrollers to the first section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:1 withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:2 withTitle:@"Second View" andIcon:@"icon2.png"];

	// Add a second section
	[self.slideoutController addSectionWithTitle:@"Section Two"];

	// Add two viewcontrollers to the second section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:3 withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:4 withTitle:@"Second View" andIcon:@"icon2.png"];
	
	[self.window setRootViewController:self.slideoutController];

Sections
--------------------
Leave the section name blank if you don't want the section header visible.

Badges
--------------------
Set the badge value (NSString) via the method ```setBadgeValue:forTag:```. This sets the badge value of the row with the numeric tag provided during the views' setup.

	[self.slideoutController setBadgeValue:@"10" forTag:3];

Icons
--------------------
The icon must be 44x44. Blank icon name will result in a row with only text, with different indentation.


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