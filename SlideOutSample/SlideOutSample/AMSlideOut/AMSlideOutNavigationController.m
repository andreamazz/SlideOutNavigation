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

@end

@implementation AMSlideOutNavigationController

@synthesize options = _options;

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
					AMOptionsUseDefaultTitles : @(YES),
					AMOptionsSlideValue : @(270),
					AMOptionsBackground : [UIColor colorWithRed:0.19 green:0.22 blue:0.29 alpha:1.0],
					AMOptionsSelectionBackground : [UIColor colorWithRed:0.10 green:0.13 blue:0.20 alpha:1.0],
					AMOptionsImagePadding : @(50),
					AMOptionsTextPadding : @(20),
					AMOptionsBadgePosition : @(220),
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
					AMOptionsCellShadowColor : [UIColor colorWithRed:0.21 green:0.15 blue:0.19 alpha:1.0]
					}];
	}
	return _options;
}

- (id)initWithMenuItems:(NSArray*)items
{
	self = [super init];
	if (self) {
		_menuVisible = NO;
		self.menuItems = [NSMutableArray arrayWithArray:items];
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
		_menuVisible = NO;
		self.menuItems = [[NSMutableArray alloc] init];
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
	[section setObject:title forKey:kSOSectionTitle];
	[section setObject:[[NSMutableArray alloc] init] forKey:kSOSection];
	
	[self.menuItems addObject:section];
}

- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(NSString*)icon toSection:(NSInteger)section
{
	[self addViewControllerToLastSection:controller
								  tagged:tag
							   withTitle:title
								 andIcon:icon
							beforeChange:nil
						  onCompletition:nil];
}

- (void)addViewController:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(NSString*)icon toSection:(NSInteger)section  beforeChange:(void(^)())before onCompletition:(void(^)())after
{
	if (section < [self.menuItems count]) {
		NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
		[item setObject:controller forKey:kSOController];
		[item setObject:title forKey:kSOViewTitle];
		[item setObject:icon forKey:kSOViewIcon];
		if (before) {
			[item setObject:[before copy] forKey:kSOBeforeBlock];
		}
		if (after) {
			[item setObject:[after copy] forKey:kSOAfterBlock];
		}
		[item setObject:[NSNumber numberWithInt:tag] forKey:kSOViewTag];
		[[[self.menuItems objectAtIndex:section] objectForKey:kSOSection] addObject:item];
	} else {
		NSLog(@"AMSlideOutNavigation: section index out of bounds");
	}
}

- (void)setBadgeValue:(NSString*)value forTag:(int)tag
{
	for (NSDictionary* section in self.menuItems) {
		for (NSMutableDictionary* item in [section objectForKey:kSOSection]) {
			if ([[item objectForKey:kSOViewTag] intValue] == tag) {
				[item setObject:value forKey:kSOViewBadge];
			}
		}
	}
	// Save and reselect the row after the reload
	NSIndexPath *ipath = [self.tableView indexPathForSelectedRow];
	[self.tableView reloadData];
	[self.tableView selectRowAtIndexPath:ipath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(NSString*)icon
{
	[self addViewController:controller tagged:tag withTitle:title andIcon:icon toSection:([self.menuItems count]-1)];
}

- (void)addViewControllerToLastSection:(UIViewController*)controller tagged:(int)tag withTitle:(NSString*)title andIcon:(NSString*)icon beforeChange:(void(^)())before onCompletition:(void(^)())after
{
	[self addViewController:controller tagged:tag withTitle:title andIcon:icon toSection:([self.menuItems count]-1) beforeChange:before onCompletition:after];
}

- (void)setContentViewController:(UIViewController *)controller
{
	// Sets the view controller as the new root view controller for the navigation controller
	[self.contentController setViewControllers:[NSArray arrayWithObject:controller] animated:NO];
	self.contentView = self.contentController.view;
	[self.contentView removeFromSuperview];
	[self.view addSubview:self.contentView];
	[self.contentController.topViewController.navigationItem setLeftBarButtonItem:_barButton];
}

- (void)loadView
{
	UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[view setBackgroundColor:self.options[AMOptionsBackground]];
	
	// Table View setup
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height - 20)];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.backgroundColor = self.options[AMOptionsBackground];
	
	// The content is displayed in a UINavigationController
	self.contentController = [[UINavigationController alloc] init];
	self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(-10, 0);
    self.contentView.layer.shadowOpacity = 0.4;
    self.contentView.layer.shadowRadius = 10.0;
    self.contentView.clipsToBounds = NO;
	
	/* The transparent overlay view will catch all the user touches in the content area
	 when the slide menu is visible */
	_overlayView = [[UIView alloc] initWithFrame:self.contentController.view.frame];
	_overlayView.userInteractionEnabled = YES;
	_overlayView.backgroundColor = [UIColor clearColor];
	
	[view addSubview:self.tableView];
	
	self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.tableView setDelegate:self];
	[self.tableView setDataSource:self];
	
	_barButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconSlide.png"]
												  style:UIBarButtonItemStylePlain
												 target:self
												 action:@selector(toggleMenu)];
	
	// Detect when the content recieves a single tap
	_tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[_overlayView addGestureRecognizer:_tapGesture];
	
	// Detect when the content is touched and dragged
	_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
	[_panGesture setMaximumNumberOfTouches:2];
	[_panGesture setDelegate:self];
	[_overlayView addGestureRecognizer:_panGesture];

	[_contentController.view addGestureRecognizer:_panGesture];
	
	// Select the first view controller
	[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
	[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)setMenuItems:(NSArray *)menuItems
{
	// Makes sure to refresh the table data when new items are set
	_menuItems = [NSMutableArray arrayWithArray:menuItems];
	[self.tableView reloadData];
}

#pragma mark Table View delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.menuItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[[self.menuItems objectAtIndex:section] objectForKey:kSOSection] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[self.menuItems objectAtIndex:section] objectForKey:kSOSectionTitle];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* cellID = @"AMSlideTableCell";
	
	NSDictionary* dict = [[[self.menuItems objectAtIndex:indexPath.section] objectForKey:kSOSection] objectAtIndex:indexPath.row];
	UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
	if (cell == nil) {
		cell = [[AMSlideTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
	}
	
	((AMSlideTableCell*)cell).options = self.options;
	cell.textLabel.text = [dict objectForKey:kSOViewTitle];
	UIView* selection = [[UIView alloc] initWithFrame:cell.frame];
	[selection setBackgroundColor:self.options[AMOptionsSelectionBackground]];
	cell.selectedBackgroundView = selection;

	[(AMSlideTableCell*)cell setBadgeText:[dict objectForKey:kSOViewBadge]];
	
	NSString* image = [dict objectForKey:kSOViewIcon];
	if (image != nil && ![image isEqualToString:@""]) {
		cell.imageView.image = [UIImage imageNamed:image];
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
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary* dict = [[[self.menuItems objectAtIndex:indexPath.section] objectForKey:kSOSection] objectAtIndex:indexPath.row];
	
	AMSlideOutBeforeHandler before = dict[kSOBeforeBlock];
	if (before) {
		before();
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

- (void)toggleMenu
{
	if (_menuVisible) {
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
						 [self.contentController.topViewController.view addSubview:_overlayView];
						 _menuVisible = YES;
						 [_barButton setStyle:UIBarButtonItemStyleDone];
					 }];
	
}

- (void)hideSideMenu
{
    // this animates the screenshot back to the left before telling the app delegate to swap out the MenuViewController
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
						 [_overlayView removeFromSuperview];
						 _menuVisible = NO;
						 [_barButton setStyle:UIBarButtonItemStylePlain];
					 }];
}

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    // A single tap hides the slide menu
    [self hideSideMenu];
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
		if (_menuVisible) {
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
	[_overlayView removeGestureRecognizer:_tapGesture];
    [_overlayView removeGestureRecognizer:_panGesture];
	_tapGesture = nil;
	_panGesture = nil;
	_overlayView = nil;
	_barButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
