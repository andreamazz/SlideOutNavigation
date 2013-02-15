//
//  AMAppDelegate.h
//  SlideoutStoryboardSample
//
//  Created by Andrea on 15/02/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMSlideOutNavigationController;

@interface AMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AMSlideOutNavigationController*	slideoutController;


@end
