//
//  AMSlideOutNavigationController.m
//  SlideOut
//
//  Created by Andrea on 12/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideOutNavigationController.h"
#import "AMSlideTableCell.h"
#import "AMSlideTableHeader.h"

@interface AMSlideOutNavigationController ()

@property (strong, nonatomic)	NSMutableDictionary*	options;
@property (strong, nonatomic)	AMTableView*			tableView;
@property BOOL											menuVisible;
@property (strong, nonatomic)	UIView*					overlayView;
@property (strong, nonatomic)	UIBarButtonItem*		barButton;
@property (strong, nonatomic)	UITapGestureRecognizer*	tapGesture;
@property (strong, nonatomic)	UIPanGestureRecognizer*	panGesture;

@end

@implementation AMSlideOutNavigationController


- (void)setSlideoutOptions:(NSDictionary *)options
{
	[self.options addEntriesFromDictionary:options];
}

- (NSMutableDictionary*)options
{
	if (_options == nil) {
		_options = [[NSMutableDictionary alloc]
					initWithDictionary:
					@{
					AMOptionsEnableGesture : @(YES),
					AMOptionsEnableShadow : @(YES),
					AMOptionsSetButtonDone : @(NO),
					AMOptionsUseBorderedButton : @(NO),
					AMOptionsButtonIcon : [UIImage imageNamed:@"iconSlide.png"],
					AMOptionsUseDefaultTitles : @(YES),
					AMOptionsSlideValue : @(270),
					AMOptionsBackground : [UIColor colorWithRed:0.19 green:0.22 blue:0.29 alpha:1.0],
					AMOptionsSelectionBackground : [UIColor colorWithRed:0.10 green:0.13 blue:0.20 alpha:1.0],
					AMOptionsImagePadding : @(50),
					AMOptionsTextPadding : @(20),
					AMOptionsBadgePosition : @(220),
                    AMOptionsHeaderHeight : @(22),
					AMOptionsHeaderFont : [UIFont fontWithName:@"Helvetica" size:13],
					AMOptionsHeaderFontColor : [UIColor colorWithRed:0.49 green:0.50 blue:0.57 alpha:1.0],
					AMOptionsHeaderShadowColor : [UIColor colorWithRed:0.21 green:0.15 blue:0.19 alpha:1.0],
					AMOptionsHeaderPadding : @(10),
					AMOptionsHeaderGradientUp : [UIColor colorWithRed:0.26 green:0.29 blue:0.36 alpha:1],
					AMOptionsHeaderGradientDown : [UIColor colorWithRed:0.22 green:0.25 blue:0.32 alpha:1],
					AMOptionsHeaderSeparatorUpper : [UIColor colorWithRed:0.24 green:0.27 blue:0.33 alpha:1.0],
					AMOptionsHeaderSeparatorLower : [UIColor colorWithRed:0.14 green:0.16 blue:0.21 alpha:1.0],
					AMOptionsCellFont : [UIFont fontWithName:@"Helvetica" size:14],
					AMOptionsCellBadgeFont : [UIFont fontWithName:@"Helvetica" size:12],
					AMOptionsCellFontColor : [UIColor colorWithRed:0.77 green:0.8 blue:0.85 alpha:1.0],
					AMOptionsCellBackground : [UIColor colorWithRed:0.19 green:0.22 blue:0.29 alpha:1.0],
					AMOptionsCellSeparatorUpper : [UIColor colorWithRed:0.24 green:0.27 blue:0.33 alpha:1.0],
					AMOptionsCellSeparatorLower : [UIColor colorWithRed:0.14 green:0.16 blue:0.21 alpha:1.0],
					AMOptionsCellShadowColor : [UIColor colorWithRed:0.21 green:0.15 blue:0.19 alpha:1.0],
                    AMOptionsImageHeight : @(44),
                    AMOptionsImageOffsetByY : @(0)
					}];
	}
	return _options;
}

- (id)initWithMenuItems:(NSArray*)items
{
	self = [super init];
	if (self) {
		self.menuVisible = NO;
		_menuItems = [NSMutableArray arrayWithArray:items];
	}
	return self;
}

+ (id)slideOutNavigationWithMenuItems:(NSArray*)items
{
	return [[AMSlideOutNavigationController alloc] initWithMenuItems:items];
}

- (id)init
{
	self = [super init];
	if (self) {
		self.menuVisible = NO;
		_menuItems = [[NSMutableArray alloc] init];
        self.navigationControllerClass = [UINavigationController class];
	}
	return self;
}

+ (id)slideOutNavigation
{
	return [[AMSlideOutNavigationController alloc] init];
}

- (void)addSectionWithTitle:(NSString*)title
{
	NSMutableDictionary* section = [[NSMutableDictionary alloc] init];
	section[kSOSectionTitle] = title;
	section[kSOSection] = [[NSMutableArray alloc] init];
	
	[self.menuItems addObject:section];
}

- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section
{
	[self addViewController:controller
					 tagged:tag
				  withTitle:title
					andIcon:icon
				  toSection:section
			   beforeChange:nil
			 onCompletition:nil];
}

- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section  beforeChange:(void(^)())before onCompletition:(void(^)())after
{
	if (section < [self.menuItems count]) {
		NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
		item[kSOController] = controller;
		item[kSOViewTitle] = title;
		item[kSOViewIcon] = icon;
		if (before) {
			item[kSOBeforeBlock] = [before copy];
		}
		if (after) {
			item[kSOAfterBlock] = [after copy];
		}
		item[kSOViewTag] = @(tag);
		[(self.menuItems)[section][kSOSection] addObject:item];
	} else {
		NSLog(@"AMSlideOutNavigation: section index out of bounds");
	}
}

- (void)addAction:(void(^)())action tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon toSection:(NSInteger)section
{
	if (section < [self.menuItems count]) {
		NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
		item[kSOViewTitle] = title;
		item[kSOViewIcon] = icon;
		// Note: The action is stored in the before block
		item[kSOBeforeBlock] = [action copy];
		item[kSOViewTag] = @(tag);
		item[kSOItemIsAction] = @(YES);
		[(self.menuItems)[section][kSOSection] addObject:item];
	} else {
		NSLog(@"AMSlideOutNavigation: section index out of bounds");
	}
}

- (void)setBadgeValue:(NSString*)value forTag:(int)tag
{
	for (NSDictionary* section in self.menuItems) {
		for (NSMutableDictionary* item in section[kSOSection]) {
			if ([item[kSOViewTag] intValue] == tag) {
				item[kSOViewBadge] = value;
			}
		}
	}
	// Save and reselect the row after the reload
	NSIndexPath *ipath = [self.tableView indexPathForSelectedRow];
	[self.tableView reloadData];
	[self.tableView selectRowAtIndexPath:ipath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon
{
	[self addViewController:controller tagged:tag withTitle:title andIcon:icon toSection:([self.menuItems count]-1)];
}

- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon beforeChange:(void(^)())before onCompletition:(void(^)())after
{
	[self addViewController:controller tagged:tag withTitle:title andIcon:icon toSection:([self.menuItems count]-1) beforeChange:before onCompletition:after];
}

- (void)addActionToLastSection:(void(^)())action tagged:(int)tag withTitle:(NSString*)title andIcon:(id)icon
{
	[self addAction:action tagged:tag withTitle:title andIcon:icon toSection:([self.menuItems count]-1)];
}

- (void)setContentViewController:(UIViewController *)controller
{
	[self.contentController setViewControllers:@[controller]];
    [controller.navigationItem setLeftBarButtonItem:self.barButton];
    self.currentViewController = controller;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[self.currentViewController.navigationController.navigationBar sizeToFit];
}

- (void)loadView
{
	UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[view setBackgroundColor:self.options[AMOptionsBackground]];
	
	// Table View setup
	self.tableView = [[AMTableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 20)];
	self.tableView.options = self.options;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.backgroundColor = self.options[AMOptionsBackground];
	[self.tableView setScrollsToTop:NO];
	
	// The content is displayed in a UINavigationController
	self.contentController = [[self.navigationControllerClass alloc] init];
	
	if ([self.options[AMOptionsEnableShadow] boolValue]) {
		self.contentController.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.contentController.view.bounds].CGPath;
		self.contentController.view.layer.shadowColor = [UIColor blackColor].CGColor;
		self.contentController.view.layer.shadowOffset = CGSizeMake(-6, 0);
		self.contentController.view.layer.shadowOpacity = 0.4;
		self.contentController.view.clipsToBounds = NO;
	}
	
	/* The transparent overlay view will catch all the user touches in the content area
	 when the slide menu is visible */
	self.overlayView = [[UIView alloc] initWithFrame:self.contentController.view.frame];
	self.overlayView.userInteractionEnabled = YES;
	self.overlayView.backgroundColor = [UIColor clearColor];
	
	[view addSubview:self.tableView];
	[view addSubview:self.contentController.view];
    
	self.view = view;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.currentViewController = nil;
	
	[self.tableView setDelegate:self];
	[self.tableView setDataSource:self];
	
	if ([self.options[AMOptionsUseBorderedButton] boolValue]) {
		self.barButton = [[UIBarButtonItem alloc] initWithImage:self.options[AMOptionsButtonIcon]
														  style:UIBarButtonItemStylePlain
														 target:self
														 action:@selector(toggleMenu)];
		
	} else  {
		UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setImage:self.options[AMOptionsButtonIcon] forState:UIControlStateNormal];
		[button setFrame:CGRectMake(0, 0, 44, 22)];
		[button addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
		// Adding the button as subview to an UIView prevents the touch area to be too wide
		UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 22)];
		[buttonContainer addSubview:button];
		self.barButton = [[UIBarButtonItem alloc] initWithCustomView:buttonContainer];
	}
	
	// Detect when the content recieves a single tap
	self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[self.overlayView addGestureRecognizer:self.tapGesture];
	
	// Detect when the content is touched and dragged
	self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
	[self.panGesture setMaximumNumberOfTouches:2];
	[self.panGesture setDelegate:self];
	[self.overlayView addGestureRecognizer:self.panGesture];
    
	[self.contentController.view addGestureRecognizer:self.panGesture];
	
	// Select the first view controller
	[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
	[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)setMenuItems:(NSArray *)menuItems
{
	// Makes sure to refresh the table data when new items are set
	_menuItems = [NSMutableArray arrayWithArray:menuItems];
	NSIndexPath *ipath = [self.tableView indexPathForSelectedRow];
	[self.tableView reloadData];
	if (ipath) {
		[self.tableView selectRowAtIndexPath:ipath animated:NO scrollPosition:UITableViewScrollPositionNone];
	}
}

#pragma mark Table View delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.menuItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [(self.menuItems)[section][kSOSection] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return (self.menuItems)[section][kSOSectionTitle];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* cellID = @"AMSlideTableCell";
	
	NSDictionary* dict = (self.menuItems)[indexPath.section][kSOSection][indexPath.row];
	UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
	if (cell == nil) {
		cell = [[AMSlideTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
		UIView* selection = [[UIView alloc] initWithFrame:cell.frame];
		[selection setBackgroundColor:self.options[AMOptionsSelectionBackground]];
		cell.selectedBackgroundView = selection;
	}
	
	((AMSlideTableCell*)cell).options = self.options;
	cell.textLabel.text = dict[kSOViewTitle];
	[(AMSlideTableCell*)cell setBadgeText:dict[kSOViewBadge]];
    
	id imageData = dict[kSOViewIcon];
	
	if (imageData != nil) {
		if ([imageData isKindOfClass:[NSString class]] && ![imageData isEqualToString:@""]) {
			cell.imageView.image = [UIImage imageNamed:imageData];
		} else if ([imageData isKindOfClass:[UIImage class]]) {
			cell.imageView.image = imageData;
		} else {
			cell.imageView.image = nil;
		}
	} else {
		cell.imageView.image = nil;
	}
	
	return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	AMSlideTableHeader *header = [[AMSlideTableHeader alloc] init];
	header.options = self.options;
	header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	NSString* title = [self tableView:tableView titleForHeaderInSection:section];
	if (title == nil || [title isEqualToString:@""]) {
		return 0;
	}
    return [self.options[AMOptionsHeaderHeight] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary* dict = (self.menuItems)[indexPath.section][kSOSection][indexPath.row];
	
	AMSlideOutBeforeHandler before = dict[kSOBeforeBlock];
	if (before) {
		before();
	}
	
	if ([dict[kSOItemIsAction] boolValue]) {
		// If an items only contains an action (saved as a beofre handler), don't change view controller
		// just exit
		[self hideSideMenu];
		return;
	}
	
	[self setContentViewController:dict[kSOController]];
	if ([self.options[AMOptionsUseDefaultTitles] boolValue]) {
		[dict[kSOController] setTitle:dict[kSOViewTitle]];
	}
    [self hideSideMenu];
	AMSlideOutBeforeHandler after = dict[kSOAfterBlock];
	if (after) {
		after();
	}
}

- (void)switchToControllerTagged:(int)tag andPerformSelector:(SEL)selector withObject:(id)obj
{
	[self switchToControllerTagged:tag andPerformSelector:selector withObject:obj afterDelay:0];
}

- (void)switchToControllerTagged:(int)tag andPerformSelector:(SEL)selector withObject:(id)obj afterDelay:(NSTimeInterval)delay
{
	for (NSDictionary* section in self.menuItems) {
		for (NSMutableDictionary* item in [section objectForKey:kSOSection]) {
			if ([[item objectForKey:kSOViewTag] intValue] == tag) {
				int sectionIndex = [self.menuItems indexOfObject:section];
				int rowIndex = [[section objectForKey:kSOSection] indexOfObject:item];
				[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:rowIndex inSection:sectionIndex] animated:YES scrollPosition:UITableViewScrollPositionNone];
				[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:rowIndex inSection:sectionIndex]];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
				if ([[item objectForKey:kSOController] respondsToSelector:selector]) {
					[[item objectForKey:kSOController] performSelector:selector withObject:obj afterDelay:delay];
				}
#pragma clang diagnostic pop
				return;
			}
		}
	}
}

- (void)toggleMenu
{
	if (self.menuVisible) {
		[self hideSideMenu];
	} else {
		[self showSideMenu];
	}
}

- (void)showSideMenu
{
    [UIView animateWithDuration:0.15
						  delay:0
						options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 // Move the whole NavigationController view aside
						 CGRect frame = self.contentController.view.frame;
						 frame.origin.x = [self.options[AMOptionsSlideValue] floatValue];
						 self.contentController.view.frame = frame;
					 }
                     completion:^(BOOL finished) {
						 // Add the overlay that will receive the gestures
						 [self.tableView setScrollsToTop:YES];
						 [self.contentController.view addSubview:self.overlayView];
						 self.menuVisible = YES;
						 if ([self.options[AMOptionsSetButtonDone] boolValue]) {
							 [self.barButton setStyle:UIBarButtonItemStyleDone];
						 }
					 }];
	
}

- (void)hideSideMenu
{
    // this animates the view back to the left before telling the app delegate to swap out the MenuViewController
    // it tells the app delegate using the completion block of the animation
    [UIView animateWithDuration:0.15
						  delay:0
						options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 // Move back the NavigationController
						 CGRect frame = self.contentController.view.frame;
						 frame.origin.x = 0;
						 self.contentController.view.frame = frame;
					 }
                     completion:^(BOOL finished) {
						 [self.overlayView removeFromSuperview];
						 self.menuVisible = NO;
						 [self.tableView setScrollsToTop:NO];
						 [self.barButton setStyle:UIBarButtonItemStylePlain];
					 }];
}

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    // A single tap hides the slide menu
    [self hideSideMenu];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
	return [self.options[AMOptionsEnableGesture] boolValue];
}

/* The following is from
 http://blog.shoguniphicus.com/2011/06/15/working-with-uigesturerecognizers-uipangesturerecognizer-uipinchgesturerecognizer/
 as mentioned by Nick Harris, in his approach to slide-out navigation:
 http://nickharris.wordpress.com/2012/02/05/ios-slide-out-navigation-code/
 */
- (void)handlePan:(UIPanGestureRecognizer *)gesture;
{
	// The pan gesture moves horizontally the view
    UIView *piece = self.contentController.view;
    [self adjustAnchorPointForGestureRecognizer:gesture];
    
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [gesture translationInView:[piece superview]];
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y)];
		if (piece.frame.origin.x < 0) {
			[piece setFrame:CGRectMake(0, piece.frame.origin.y, piece.frame.size.width, piece.frame.size.height)];
		}
		if (piece.frame.origin.x > 320) {
			[piece setFrame:CGRectMake(320, piece.frame.origin.y, piece.frame.size.width, piece.frame.size.height)];
		}
        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
    else if ([gesture state] == UIGestureRecognizerStateEnded) {
		// Hide the slide menu only if the view is released under a certain threshold, the threshold is lower when the menu is hidden
		float threshold;
		if (self.menuVisible) {
			threshold = [self.options[AMOptionsSlideValue] floatValue];
		} else {
			threshold = [self.options[AMOptionsSlideValue] floatValue] / 2;
		}
        
		if (self.contentController.view.frame.origin.x < threshold) {
			[self hideSideMenu];
		} else {
			[self showSideMenu];
		}
	}
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = self.contentController.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	[self setTableView:nil];
	[self setContentController:nil];
	[self.overlayView removeGestureRecognizer:self.tapGesture];
    [self.overlayView removeGestureRecognizer:self.panGesture];
	self.tapGesture = nil;
	self.panGesture = nil;
	self.overlayView = nil;
	self.barButton = nil;
}

@end
