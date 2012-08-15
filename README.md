AMSlideOutNavigationController
==================

SlideOut Navigation Controller for iOS.
This controller replicates the behaviour of the 'slide-out' navigation of applications like Facebook or Steam.
The project currently mimics FB's app styling, you can change all the table colors in the ```AMSlideOutGlobals.h```. 
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
You need to init the controller passing an array of sections. Each section item is a dictionary, containing the section title and an array describing the ViewControllers. Each item of this array is a dictionary containing the title, 44x44 icon (if present) and the reference to the ViewController. 

You can use the following helper methods to setup your views:

* ```addSectionWithTitle:``` to add a section
* ```addViewControllerToLastSection:withTitle:andIcon:``` to add a viewcontroller to the last section
* ```addViewController:withTitle:andIcon:toSection:``` to add a viewcontroller to a specific section

You can also pass the complete data structure to the init method, but it's not recommended.
Check out the sample to understand how these methods work.

Sample
--------------------
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];

	// Add a first section
	[self.slideoutController addSectionWithTitle:@"Section One"];

	// Add two viewcontrollers to the first section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"Second View" andIcon:@"icon2.png"];

	// Add a first section
	[self.slideoutController addSectionWithTitle:@"Section Two"];

	// Add two viewcontrollers to the second section
	controller = [[UIViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	// Blank icon will result in a row with only text, with different indentation
	[self.slideoutController addViewControllerToLastSection:controller withTitle:@"Second View" andIcon:@""];

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