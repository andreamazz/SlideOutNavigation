AMSlideOutNavigationController
==================
[![Stories in Ready](https://badge.waffle.io/andreamazz/SlideOutNavigation.png?label=ready)](https://waffle.io/andreamazz/SlideOutNavigation)  

SlideOut Navigation Controller for iOS.
This controller replicates the behaviour of the 'slide-out' navigation of applications like Facebook or Steam.
The project currently mimics FB's app styling, you can change all the table colors and options using the Options Dictionary (see documentation below). 
ARC only.

Part of the code is based off [this blog post made by Nick Harris](http://nickharris.wordpress.com/2012/02/05/ios-slide-out-navigation-code/)

Screenshot
--------------------
![SlideOutNavigation](http://www.eflatgames.com/github/AMSlideOut1508.png) ![SlideOutNavigation](http://www.eflatgames.com/github/AMSlideOut130413.png)


Setup with Cocoapods
--------------------
* Add ```pod 'AMSlideOutController'``` to your Podfile
* Run ```pod install```
* Run ```open App.xcworkspace```
* Import ```AMSlideOutNavigationController.h``` in your AppDelegate
* Init ```AMSlideOutNavigationController```  using the data structure as follows.

Setup without Cocoapods
--------------------
* Clone this repo
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
* ```addViewControllerToLastSection:tagged:withTitle:andIcon:beforeChange:onCompletition:``` to add a viewcontroller and call a block before and after the view switch
* ```addViewController:tagged:withTitle:andIcon:toSection:``` to add a viewcontroller to a specific section
* ```addViewController:tagged:withTitle:andIcon:toSection:beforeChange:onCompletition:``` to add a viewcontroller to a specific section and call a block before and after the switch

To create a new section:

```objc
// Note: Leave the title blank to hide the section header
[self.slideoutController addSectionWithTitle:@"Section"];
```

To create a new row:

```objc
[self.slideoutController addViewControllerToLastSection:controller		// Your UIViewController
												 tagged:1				// Used to change the object's properties, i.e. the badge
											  withTitle:@"First View"	
												andIcon:@"icon1.png"];	// 44x44 icon held in the project's resources
```
                                                    
To create a new row that only calls an action:
   
```objc 
[self.slideoutController addActionToLastSection:^{
	// some action
}
										 tagged:3
									  withTitle:@"Action"
										andIcon:@""];
```
    

The main data structure is an array of sections. Each section item is a dictionary, containing the section title and an array describing the ViewControllers. Each item of this array is a dictionary containing the title, icon's file name, a numeric tag and the reference to the ViewController. 
You can also pass the complete data structure to the init method, but it's not recommended. 
Check out the sample to understand how these methods work.

Options Dictionary
--------------------
As of version 1.0.0 AMSlideOutNavigationController's configuration can be handled by passing an NSDictionary to it. The default values can be found in  AMSlideOutNavigationController.m. Here's a brief description of the possible options:

```objc
AMOptionsEnableGesture            // @(BOOL), Enables the pan gesture. Defaults to YES
AMOptionsEnableShadow             // @(BOOL), Enables the shadow under the content's view. Defaults to YES
AMOptionsSetButtonDone            // @(BOOL), Sets the Menu button's state to 'Done' when the tray is open. Defaults to NO
AMOptionsUseBorderedButton        // @(BOOL), Sets the Menu button to have a bordered style. Defaults to NO
AMOptionsButtonIcon               // UIImage, Icon displayed in the Menu button. Defaults to the embedded 'iconSlide.png'
AMOptionsTableBackground          // UIImage, Background image displayed and tiled as the TableView's background. Defaults to nil (solid color)
AMOptionsTableOffestY             // @(float), Y offset for the menu table. Defaults to 20.0f in iOS7, 0.0f in previous versions.
AMOptionsUseDefaultTitles         // @(BOOL), When enabled the content view's title is set as the manu item's text. Defaults to YES
AMOptionsSlideValue               // @(float), The width of the menu. The content's view snaps to this value. Defaults to 270
AMOptionsBackground               // UIColor, Menu's background color. Defaults to the one in the main screenshot of this page
AMOptionsSelectionBackground      // UIColor, Menu background color for the selected item. Defaults to the one in the main screenshot of this page
AMOptionsHeaderFont               // UIFont, Font used in the menu header. Defaults to Helvetica@13
AMOptionsHeaderFontColor          // UIColor, Font color used in the menu header. Defaults to the one in the main screenshot of this page
AMOptionsHeaderShadowColor        // UIColor, Shadow color used in the menu header. Defaults to the one in the main screenshot of this page
AMOptionsHeaderPadding            // @(float), Padding used in the menu header. Defaults to 10
AMOptionsHeaderGradientUp         // UIColor, Menu's gradient starting color. Defaults to the one in the main screenshot of this page
AMOptionsHeaderGradientDown       // UIColor, Menu's gradient ending color. Defaults to the one in the main screenshot of this page
AMOptionsHeaderSeparatorUpper     // UIColor, Color used in the menu header separator. Defaults to the one in the main screenshot of this page
AMOptionsHeaderSeparatorLower     // UIColor, Color used in the menu header separator. Defaults to the one in the main screenshot of this page
AMOptionsCellFont                 // UIFont, Font used in the menu item. Defaults to Helvetica@14
AMOptionsCellFontColor            // UIColor, Font color used in the menu item. Defaults to the one in the main screenshot of this page
AMOptionsCellBadgeFont            // UIFont, Font used in the menu badge. Defaults to Helvetica@12
AMOptionsCellBackground           // UIColor, Menu item background color. Defaults to the one in the main screenshot of this page
AMOptionsCellSeparatorUpper       // UIColor, Color used in the menu separator. Defaults to the one in the main screenshot of this page
AMOptionsCellSeparatorLower       // UIColor, Color used in the menu separator. Defaults to the one in the main screenshot of this page
AMOptionsCellShadowColor          // UIColor, Shadow color used in the menu item. Defaults to the one in the main screenshot of this page
AMOptionsImagePadding             // @(float), Padding used in the menu icon. Defaults to 50
AMOptionsImageLeftPadding         // @(float), Left padding used in the menu icon for the image. Defaults to 5
AMOptionsTextPadding              // @(float), Padding used in the menu item. Defaults to 20
AMOptionsBadgePosition            // @(float), Badge's left offset. Defaults to 220
AMOptionsHeaderHeight             // @(float), Menu header's height. Defaults to 22
AMOptionsImageHeight              // @(float), Menu icon's height. Max value is currently 44 pixels. Defaults to 44
AMOptionsImageOffsetByY           // @(float), Menu icon's offset from the top. Defaults to 0
AMOptionsAnimationShrink          // @(BOOL), Enables the Shrink animation. Defaults to @YES
AMOptionsAnimationShrinkValue     // @(float), The amount of scaling for the shrink animation. Defauults to @0.3
AMOptionsAnimationDarken          // @(BOOL), Enables the fadout animation. Defaults to @YES
AMOptionsAnimationDarkenValue     // @(float), The darker alpha value of the dark overlay. Defaults to @0.7
AMOptionsAnimationDarkenColor     // UIColor, The base color of the fadout animation. Defaults to [UIColor blackColor]
AMOptionsAnimationSlide           // @(BOOL), Enables the slide animation of the menu to the side. Defaults to @NO
AMOptionsAnimationSlidePercentage // @(float), Value from 0 to 1. Determines how much the table should slide aside
AMOptionsTableHeaderClass         // NSString, The class name of your custom header. Defaults to AMSlideTableHeader
AMOptionsDisableMenuScroll        // @(BOOL), Prevents the menu scrolling if its content's height is less than the view's height. Defaults to @NO
AMOptionsTableCellClass           // NSString, The class name of your custom cell. It must inherit from AMSlideTableCell. Defaults to AMSlideTableCell
AMOptionsTableCellHeight          // @(float), The default cell's height. Defaults to @44
AMOptionsTableIconMaxSize         // @(float), the default menu item's icon. Defaults to @44
AMOptionsSlideoutTime             // @(float), The default duration of the open/close animation. Defaults to @0.15
AMOptionsTableBadgeHeight         // @(float), The table badge height. Defaults to @20 
```

sample usage:

```objc
self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];

[self.slideoutController setSlideoutOptions:@{
						   AMOptionsEnableShadow : @(NO),
					       AMOptionsHeaderFont : [UIFont systemFontOfSize:14]
 }];
```

Further customization
--------------------
To customize the appearance of your navigation bar you can use the system's UIAppearance class, i.e.:

```objc
// Navbar customization
[[UINavigationBar appearance] setTintColor:[UIColor redColor]];
[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    
// Navbar font customization
NSDictionary *attributes = @{UITextAttributeFont: [UIFont fontWithName:@"Copperplate" size:14]};
NSDictionary *titleAttributes = @{UITextAttributeFont: [UIFont fontWithName:@"Copperplate" size:20]};
[[UIBarButtonItem appearance] setTitleTextAttributes: attributes
											forState: UIControlStateNormal];
[[UINavigationBar appearance] setTitleTextAttributes: titleAttributes];

// Back button customization
UIImage *barButton = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(-2,5,0,6)];
[[UIBarButtonItem appearance] setBackgroundImage:barButton forState:UIControlStateNormal
									  barMetrics:UIBarMetricsDefault];
[[UINavigationBar appearance] setTitleVerticalPositionAdjustment:4 forBarMetrics:UIBarMetricsDefault];
```

Using UIAppearance and the options' dictionary you can easily achieve a view similiar to the second screenshot in this page.


Sample
--------------------

```objc
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
controller = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
[self.slideoutController addViewControllerToLastSection:controller
												 tagged:3
											  withTitle:@"First View"
												andIcon:@"icon1.png"
										   beforeChange:^{
											   NSLog(@"Changing viewController");
										   } onCompletition:^{
											   NSLog(@"Done");
										   }];

controller = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
[self.slideoutController addViewControllerToLastSection:controller tagged:4 withTitle:@"Second View" andIcon:@"icon2.png"];

[self.window setRootViewController:self.slideoutController];
```

Storyboard
--------------------
If you use Storyboard you can easily integrate AMSlideOutNavigationController within your AppDelegate.

Just set a Storyboard ID for each of your ViewController that will become a root element of the navigation tree:

![SlideOutNavigationStoryboard](http://www.eflatgames.com/github/AMSlideOutStory.png)

then instantiate your ViewControllers in your AppDelegate like this:

```objc
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

UIViewController* controller;

self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];

[self.slideoutController addSectionWithTitle:@""];

controller = [storyboard instantiateViewControllerWithIdentifier:@"FirstController"];
[self.slideoutController addViewControllerToLastSection:controller tagged:1 withTitle:@"First View" andIcon:@""];

controller = [storyboard instantiateViewControllerWithIdentifier:@"SecondController"];
[self.slideoutController addViewControllerToLastSection:controller tagged:2 withTitle:@"Second View" andIcon:@""];

[self.window setRootViewController:self.slideoutController];
```

Sections
--------------------
1.6+:
Pass a nil value as the section name if you don't want the section header visible.
You can specify a custom header class and height for each section, this will give you the opportunity to add a separator that looks different from an header. 
You can also define a global custom header class. Your custom class must be a subclass of ```AMSlideTableHeader```.
Pre 1.6:
Leave the section name blank if you don't want the section header visible.


Badges
--------------------
Set the badge value (NSString) via the method ```setBadgeValue:forTag:```. This sets the badge value of the row with the numeric tag provided during the views' setup.

```objc
[self.slideoutController setBadgeValue:@"10" forTag:3];
```

Icons
--------------------
The icon must be 44x44. Blank icon name will result in a row with only text, with different indentation.

Changelog 
==================

v1.7
--------------------
- Added accessibility support. (Thanks to [Michael James](https://github.com/umjames))
- Added ability to use custom cells for the menu items.

v1.6
--------------------
- Added slide animation to the menu.
- Changed header configuration.
- Added option to use a custom default header view.
- Added option to use a custom headers view for each section header.
- Added ```setMenuScrollingEnabled``` methos

v1.5
--------------------
- Added shrink and fadeout animations to the menu drawer.

v1.4
--------------------
- Added the ability to use either a string with the image name or the UIImage itself for the controller's icon.

v1.3
--------------------
- Added rotation support
- Minor bugfixes

v1.2
--------------------

Added a method to programmatically switch controller and perform an action afterwards

    - (void)switchToControllerTagged:(int)tag andPerformSelector:(SEL)selector withObject:(id)obj

Using this library?
==================
Please let me know! I'll be glad to link your project here.

MIT License
==================
	Copyright (c) 2013 Andrea Mazzini. All rights reserved.

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