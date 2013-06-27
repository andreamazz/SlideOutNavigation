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

@property (nonatomic, assign) Class navigationControllerClass;
@property (nonatomic, assign) Class navigationBarClass;
@property (nonatomic, assign) Class navigationToolbarClass;

+ (id)slideOutNavigationWithMenuItems:(NSArray*)items;
+ (id)slideOutNavigation;
- (id)initWithMenuItems:(NSArray*)items;

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
- (void)setBadgeValue:(NSString*)value forTag:(int)tag;
- (void)showSideMenu;
- (void)hideSideMenu;
- (void)reloadTableView;

@end
