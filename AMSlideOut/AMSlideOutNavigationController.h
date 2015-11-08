//
//  AMSlideOutNavigationController.h
//  AMSlideOutNavigationController
//
//  Created by Andrea on 12/08/12.
//  Copyright (c) 2015 Andrea Mazzini. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AMSlideOutGlobals.h"
#import "AMTableView.h"

/**
 * Handler fired before showing the menu
 */
typedef void (^AMSlideOutBeforeHandler)(void);

/**
 * Completion handler fired when the transition is complete
 */
typedef void (^AMSlideOutCompletionHandler)(void);

/**
 * @name AMSlideOutNavigationController
 * SlideOut Navigation Controller
 */
@interface AMSlideOutNavigationController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

/**
 * Controller currenlty presented
 */
@property (weak, nonatomic)	UIViewController *currentViewController;

/**
 * The tag of the controller currenlty presented
 */
@property (readonly, nonatomic) NSInteger currentTag;

/**
 * Holds the items of the menu
 */
@property (strong, nonatomic) NSMutableArray *menuItems;

/**
 * The main controller showing the current controller
 */
@property (strong, nonatomic) UINavigationController* contentController;

/**
 * The tag of the first controller that will be displayed
 */
@property (assign, nonatomic) NSInteger startingControllerTag;

/**
 * The class of the navigation controller. Defaults to UINavigationController
 */
@property (nonatomic, assign) Class navigationControllerClass;

/**
 * The class of the navigation bar. Default to UINavigationBar
 */
@property (nonatomic, assign) Class navigationBarClass;

/**
 * The class of the toolbar. Defaults to UIToolbar
 */
@property (nonatomic, assign) Class navigationToolbarClass;

/**
 * The accessibility delegate
 */
@property (weak, nonatomic) id<AMSlideOutAccessibilityDelegate>  accessibilityDelegate;

/** Instantiate with a given array of menu items.
 *
 * @param items The items array.
 */
+ (id)slideOutNavigationWithMenuItems:(NSArray*)items;

/** Instantiate an empty menu */
+ (id)slideOutNavigation;

/** Instantiate an menu with an image 
 *
 * @param image The menu icon
 */
+ (id)slideOutNavigationWithImage:(NSString *)image;

/** Instantiate with a given array of menu items.
 *
 * @param items The items array.
 */
- (id)initWithMenuItems:(NSArray*)items;

/** Setups the slideout options
 *
 * @param options The options dictionary.
 */
- (void)setSlideoutOptions:(NSDictionary *)options;

/** Sets container view to a view controller without adding it to the menu  
 *
 * @param controller the controller
 */
- (void)setContentViewController:(UIViewController *)controller;

/** Add a view controller to the last section created
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 */
- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon;

/** Add a view controller to the last section created
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 */
- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon;

/** Add a view controller to the last section created
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add a view controller to the last section created
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add an action to the last section
 *
 * @param action the action block
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 */
- (void)addActionToLastSection:(void(^)())action tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon;

/** Add a view controller to the last section created given a Class
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 */
- (void)addViewControllerClassToLastSection:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon;

/** Add a view controller to the last section created given a Class
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 */
- (void)addViewControllerClassToLastSection:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon;

/** Add a view controller to the last section created given a Class
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerClassToLastSection:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add a view controller to the last section created given a Class
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerClassToLastSection:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add a view controller to a given section
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param section the section index
 */
- (void)addViewController:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section;

/** Add a view controller to a given section
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param section the section index
 */
- (void)addViewController:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon toSection:(NSInteger)section;

/** Add a view controller to a given section
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param section the section index
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewController:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add a view controller to a given section
 *
 * @param controller the controller
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param section the section index
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewController:(UIViewController*)controller tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon toSection:(NSInteger)section beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add an action to a given action
 *
 * @param action the action block
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param section the section index
 */
- (void)addAction:(void(^)())action tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section;

/** Add an action to a given action
 *
 * @param action the action block
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param section the section index
 */
- (void)addAction:(void(^)())action tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon toSection:(NSInteger)section;

/** Add a view controller for a given Class to a given section
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param section the section index
 */
- (void)addViewControllerClass:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section;

/** Add a view controller for a given Class to a given section
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param section the section index
 */
- (void)addViewControllerClass:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon toSection:(NSInteger)section;

/** Add a view controller for a given Class to a given section
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param section the section index
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerClass:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Add a view controller for a given Class to a given section
 *
 * @param clas the controller's class
 * @param nibName the NIB to load
 * @param tag the controller tag
 * @param title the controller title
 * @param icon the icon
 * @param selectionIcon the selected icon
 * @param section the section index
 * @param before the block fired before the change
 * @param after the block after before the change
 */
- (void)addViewControllerClass:(Class)cls withNibName:(NSString*)nibName tagged:(NSInteger)tag withTitle:(NSString*)title andIcon:(id)icon andSelectionIcon:(id)selectionIcon toSection:(NSInteger)section beforeChange:(void(^)())before onCompletion:(void(^)())after;

/** Switch to a controller given a tag
 *
 * @param tag the controller tag
 * @param selector the selector to perform
 * @param obj the object passed
 */
- (void)switchToControllerTagged:(NSInteger)tag andPerformSelector:(SEL)selector withObject:(id)obj;

/** Switch to a controller given a tag
 *
 * @param tag the controller tag
 * @param selector the selector to perform
 * @param obj the object passed
 * @param delay the delay
 */
- (void)switchToControllerTagged:(NSInteger)tag andPerformSelector:(SEL)selector withObject:(id)obj afterDelay:(NSTimeInterval)delay;

/** Add section
 *
 * @param title the title of the section
 */
- (void)addSectionWithTitle:(NSString*)title;

/** Add section
 *
 * @param title the title of the section
 * @param klass the header's class
 * @param height the height of the header
 */
- (void)addSectionWithTitle:(NSString*)title andHeaderClassName:(NSString*)klass withHeight:(CGFloat)height;

/** Sets the value for a specific menu item's badge
 *
 * If AMOptionsBadgeShowTotal is set to YES, the global badge will be updated with the
 * badge count of each menu item, when applicable.
 *
 * @param value The string that will be displayed in the item's badge.
 * @param tag	The tag number of the menu item.
 */
- (void)setBadgeValue:(NSString*)value forTag:(NSInteger)tag;

/** Sets a custom value in the bar button's badge.
 *
 * Make sure that AMOptionsBadgeShowTotal is set to NO, or the value will be overriden when a new
 * badge value is set for any menu item.
 * Pass a nil value to hide the badge.
 *
 * @param value The string that will be displayed in the bar button's badge.
 */
- (void)setBadgeTotalValue:(NSString*)value;

/** Opens the menu's tray */
- (void)showSideMenu;

/** Closes the menu's tray */
- (void)hideSideMenu;

/** Manually reloads the menu item's table */
- (void)reloadTableView;

/** Enables or disables the vertical scrolling of the slide menu.
 *
 * When the scroll is disabled, the value is ignored if the view's content size is greater
 * then the table size
 *
 * @param enabled	The enabled/disabled boolean flag.
 */
- (void)setMenuScrollingEnabled:(BOOL)enabled;

/** Sets a custom left bar button item
 *
 * @param barButton The custom UIBarButtonItem instance.
 */
- (void)setLeftBarButton:(UIBarButtonItem*)barButton;

/** Returns the controller with a given tag
 *
 * @param tag the tag
 * @returns the controller
 */
- (id)getControllerWithTag:(NSInteger)tag;

/**
 * Disable the gesture
 */
- (void)disableGesture;

/**
 * Enable the gesture
 */
- (void)enableGesture;

@end
