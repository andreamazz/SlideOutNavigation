//
//  AMSlideOutNavigationController.h
//  AMSlideOutNavigationController
//
//  Created by Andrea on 12/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
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

typedef void (^AMSlideOutBeforeHandler)(void);
typedef void (^AMSlideOutCompletionHandler)(void);

@interface AMSlideOutNavigationController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic)		UIViewController*		currentViewController;
@property (strong, nonatomic)	NSMutableArray*			menuItems;
@property (strong, nonatomic)	UINavigationController*	contentController;

@property (assign, nonatomic) NSInteger					startingControllerTag;

@property (nonatomic, assign) Class navigationControllerClass;
@property (nonatomic, assign) Class navigationBarClass;
@property (nonatomic, assign) Class navigationToolbarClass;

@property (weak, nonatomic) id<AMSlideOutAccessibilityDelegate>  accessibilityDelegate;

/**-----------------------------------------------------------------------------
 * @name Instantiating AMSlideOutNavigationController
 * -----------------------------------------------------------------------------
 */

/** Instantiate with a given array of menu items.
 *
 * @param items The items array.
 */
+ (id)slideOutNavigationWithMenuItems:(NSArray*)items;

/** Instantiate an empty menu */
+ (id)slideOutNavigation;

/** Instantiate with a given array of menu items.
 *
 * @param items The items array.
 */
- (id)initWithMenuItems:(NSArray*)items;

/** Setups the slideout options
 *
 * @param options The optiosn dictionary.
 */
- (void)setSlideoutOptions:(NSDictionary *)options;

- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon;
- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon beforeChange:(void(^)())before onCompletition:(void(^)())after;
- (void)addActionToLastSection:(void(^)())action tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon;

- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section;
- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section beforeChange:(void(^)())before onCompletition:(void(^)())after;
- (void)addAction:(void(^)())action tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section;

- (void)switchToControllerTagged:(int)tag andPerformSelector:(SEL)selector withObject:(id)obj;
- (void)switchToControllerTagged:(int)tag andPerformSelector:(SEL)selector withObject:(id)obj afterDelay:(NSTimeInterval)delay;

- (void)addSectionWithTitle:(NSString*)title;
- (void)addSectionWithTitle:(NSString*)title andHeaderClassName:(NSString*)klass withHeight:(CGFloat)height;

/** Sets the value for a specific menu item's badge
 *
 * If AMOptionsBadgeShowTotal is set to YES, the global badge will be updated with the
 * badge count of each menu item, when applicable.
 *
 * @param value The string that will be displayed in the item's badge.
 * @param tag	The tag number of the menu item.
 */
- (void)setBadgeValue:(NSString*)value forTag:(int)tag;

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

@end
