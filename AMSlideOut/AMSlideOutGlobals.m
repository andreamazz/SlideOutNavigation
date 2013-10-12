//
//  AMSlideOutGlobals.m
//  SlideOutSample
//
//  Created by Andrea on 12/04/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMSlideOutGlobals.h"

NSString *const AMOptionsEnableGesture = @"AMOptionsEnableGesture";
NSString *const AMOptionsEnableShadow = @"AMOptionsEnableShadow";
NSString *const AMOptionsSetButtonDone = @"AMOptionsSetButtonDone";
NSString *const AMOptionsUseBorderedButton = @"AMOptionsUseBorderedButton";
NSString *const AMOptionsButtonIcon = @"AMOptionsButtonIcon";
NSString *const AMOptionsTableBackground = @"AMOptionsTableBackground";
NSString *const AMOptionsTableOffestY = @"AMOptionsTableOffestY";
NSString *const AMOptionsUseDefaultTitles = @"AMOptionsUseDefaultTitles";
NSString *const AMOptionsSlideValue = @"AMOptionsSlideValue";
NSString *const AMOptionsBackground = @"AMOptionsBackground";
NSString *const AMOptionsSelectionBackground = @"AMOptionsSelectionBackground";
NSString *const AMOptionsHeaderHeight = @"AMOptionsHeaderHeight";
NSString *const AMOptionsHeaderFont = @"AMOptionsHeaderFont";
NSString *const AMOptionsHeaderFontColor = @"AMOptionsHeaderFontColor";
NSString *const AMOptionsHeaderShadowColor = @"AMOptionsHeaderShadowColor";
NSString *const AMOptionsHeaderPadding = @"AMOptionsHeaderPadding";
NSString *const AMOptionsHeaderGradientUp = @"AMOptionsHeaderGradientUp";
NSString *const AMOptionsHeaderGradientDown = @"AMOptionsHeaderGradientDown";
NSString *const AMOptionsHeaderSeparatorUpper = @"AMOptionsHeaderSeparatorUpper";
NSString *const AMOptionsHeaderSeparatorLower = @"AMOptionsHeaderSeparatorLower";
NSString *const AMOptionsCellFont = @"AMOptionsCellFont";
NSString *const AMOptionsCellFontColor = @"AMOptionsCellFontColor";
NSString *const AMOptionsCellBadgeFont = @"AMOptionsCellBadgeFont";
NSString *const AMOptionsCellBackground = @"AMOptionsCellBackground";
NSString *const AMOptionsCellSeparatorUpper = @"AMOptionsCellSeparatorUpper";
NSString *const AMOptionsCellSeparatorLower = @"AMOptionsCellSeparatorLower";
NSString *const AMOptionsCellShadowColor = @"AMOptionsCellShadowColor";
NSString *const AMOptionsImagePadding = @"AMOptionsImagePadding";
NSString *const AMOptionsImageLeftPadding = @"AMOptionsLeftImagePadding";
NSString *const AMOptionsImageHeight = @"AMOptionsImageHeight";
NSString *const AMOptionsImageOffsetByY = @"AMOptionsImageOffsetByY";
NSString *const AMOptionsTextPadding = @"AMOptionsTextPadding";
NSString *const AMOptionsBadgePosition = @"AMOptionsBadgePosition";
NSString *const AMOptionsDisableMenuScroll = @"AMOptionsDisableMenuScroll";
NSString *const AMOptionsAnimationShrink = @"AMOptionsAnimationShrink";
NSString *const AMOptionsAnimationShrinkValue = @"AMOptionsAnimationShrinkValue";
NSString *const AMOptionsAnimationDarken = @"AMOptionsAnimationDarken";
NSString *const AMOptionsAnimationDarkenValue = @"AMOptionsAnimationDarkenValue";
NSString *const AMOptionsAnimationDarkenColor = @"AMOptionsAnimationDarkenColor";
NSString *const AMOptionsAnimationSlide = @"AMOptionsAnimationSlide";
NSString *const AMOptionsAnimationSlidePercentage = @"AMOptionsAnimationSlidePercentage";
NSString *const AMOptionsTableHeaderClass = @"AMOptionsTableHeaderClass";
NSString *const AMOptionsTableCellClass = @"AMOptionsTableCellClass";
NSString *const AMOptionsTableCellHeight = @"AMOptionsTableCellHeight";
NSString *const AMOptionsTableIconMaxSize = @"AMOptionsTableIconMaxSize";
NSString *const AMOptionsSlideoutTime = @"AMOptionsSlideoutTime";
NSString *const AMOptionsTableBadgeHeight = @"AMOptionsTableBadgeHeight";
NSString *const AMOptionsSlideShadowOffset = @"AMOptionsSlideShadowOffset";
NSString *const AMOptionsSlideShadowOpacity = @"AMOptionsSlideShadowOpacity";
NSString *const AMOptionsBadgeShowTotal = @"AMOptionsBadgeShowTotal";
NSString *const AMOptionsBadgeGlobalFont = @"AMOptionsBadgeGlobalFont";
NSString *const AMOptionsBadgeGlobalPositionX = @"AMOptionsBadgeGlobalPositionX";
NSString *const AMOptionsBadgeGlobalPositionY = @"AMOptionsBadgeGlobalPositionY";
NSString *const AMOptionsBadgeGlobalPositionW = @"AMOptionsBadgeGlobalPositionW";
NSString *const AMOptionsBadgeGlobalPositionH = @"AMOptionsBadgeGlobalPositionH";
NSString *const AMOptionsBadgeGlobalTextColor = @"AMOptionsBadgeGlobalTextColor";
NSString *const AMOptionsBadgeGlobalBackColor = @"AMOptionsBadgeGlobalBackColor";
NSString *const AMOptionsBadgeGlobalShadowColor = @"AMOptionsBadgeGlobalShadowColor";
NSString *const AMOptionsCellBadgeFontColor = @"AMOptionsCellBadgeFontColor";
NSString *const AMOptionsCellBadgeBackColor = @"AMOptionsCellBadgeBackColor";

@implementation AMSlideOutGlobals

+ (NSDictionary*)defaultOptions
{
	CGFloat offsetY = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0") ? 20.0f : 0.0f;
	return @{
			 AMOptionsTableOffestY : @(offsetY),
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
			 AMOptionsImageLeftPadding : @(0),
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
			 AMOptionsImageOffsetByY : @(0),
			 AMOptionsCellBadgeFontColor : [UIColor whiteColor],
			 AMOptionsCellBadgeBackColor : [UIColor blackColor],
			 AMOptionsDisableMenuScroll: @NO,
			 AMOptionsAnimationShrink : @YES,
			 AMOptionsAnimationShrinkValue : @0.3,
			 AMOptionsAnimationDarken : @YES,
			 AMOptionsAnimationDarkenValue : @0.7,
			 AMOptionsAnimationDarkenColor : [UIColor blackColor],
			 AMOptionsAnimationSlide : @NO,
			 AMOptionsAnimationSlidePercentage : @0.3f,
			 AMOptionsTableHeaderClass: @"AMSlideTableHeader",
			 AMOptionsTableCellClass: @"AMSlideTableCell",
			 AMOptionsTableCellHeight: @44,
			 AMOptionsTableIconMaxSize: @44,
			 AMOptionsSlideoutTime: @0.15,
			 AMOptionsTableBadgeHeight: @20,
			 AMOptionsSlideShadowOffset: @(-6),
			 AMOptionsSlideShadowOpacity: @0.4,
			 AMOptionsBadgeShowTotal: @NO,
			 AMOptionsBadgeGlobalFont: [UIFont systemFontOfSize:8],
			 AMOptionsBadgeGlobalPositionX: @20,
			 AMOptionsBadgeGlobalPositionY: @(-5),
			 AMOptionsBadgeGlobalPositionW: @16,
			 AMOptionsBadgeGlobalPositionH: @16,
			 AMOptionsBadgeGlobalTextColor: [UIColor whiteColor],
			 AMOptionsBadgeGlobalBackColor: [UIColor redColor],
			 AMOptionsBadgeGlobalShadowColor: [UIColor clearColor]
			 };
}

+ (NSDictionary*)defaultFlatOptions
{
	CGFloat offsetY = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0") ? 20.0f : 0.0f;
	return @{
			 AMOptionsTableOffestY : @(offsetY),
			 AMOptionsEnableGesture : @(YES),
			 AMOptionsEnableShadow : @(YES),
			 AMOptionsSetButtonDone : @(NO),
			 AMOptionsUseBorderedButton : @(NO),
			 AMOptionsButtonIcon : [UIImage imageNamed:@"iconSlideBlack.png"],
			 AMOptionsUseDefaultTitles : @(YES),
			 AMOptionsSlideValue : @(270),
			 AMOptionsBackground : [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0],
			 AMOptionsSelectionBackground : [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0],
			 AMOptionsImagePadding : @(50),
			 AMOptionsImageLeftPadding : @(0),
			 AMOptionsTextPadding : @(20),
			 AMOptionsBadgePosition : @(220),
			 AMOptionsHeaderHeight : @(22),
			 AMOptionsHeaderFont : [UIFont systemFontOfSize:13],
			 AMOptionsHeaderFontColor : [UIColor blackColor],
			 AMOptionsHeaderShadowColor : [UIColor clearColor],
			 AMOptionsHeaderPadding : @(10),
			 AMOptionsHeaderGradientUp :  [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0],
			 AMOptionsHeaderGradientDown : [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0],
			 AMOptionsHeaderSeparatorUpper : [UIColor clearColor],
			 AMOptionsHeaderSeparatorLower : [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0],
			 AMOptionsCellFont : [UIFont systemFontOfSize:14],
			 AMOptionsCellBadgeFont : [UIFont systemFontOfSize:10],
			 AMOptionsCellBadgeFontColor : [UIColor whiteColor],
			 AMOptionsCellBadgeBackColor : [UIColor blackColor],
			 AMOptionsCellFontColor : [UIColor blackColor],
			 AMOptionsCellBackground : [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0],
			 AMOptionsCellSeparatorUpper : [UIColor clearColor],
			 AMOptionsCellSeparatorLower : [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0],
			 AMOptionsCellShadowColor : [UIColor clearColor],
			 AMOptionsImageHeight : @(44),
			 AMOptionsImageOffsetByY : @(0),
			 AMOptionsDisableMenuScroll: @NO,
			 AMOptionsAnimationShrink : @YES,
			 AMOptionsAnimationShrinkValue : @0.3,
			 AMOptionsAnimationDarken : @YES,
			 AMOptionsAnimationDarkenValue : @0.7,
			 AMOptionsAnimationDarkenColor : [UIColor blackColor],
			 AMOptionsAnimationSlide : @NO,
			 AMOptionsAnimationSlidePercentage : @0.3f,
			 AMOptionsTableHeaderClass: @"AMSlideTableHeader",
			 AMOptionsTableCellClass: @"AMSlideTableCell",
			 AMOptionsTableCellHeight: @44,
			 AMOptionsTableIconMaxSize: @44,
			 AMOptionsSlideoutTime: @0.15,
			 AMOptionsTableBadgeHeight: @20,
			 AMOptionsSlideShadowOffset: @(-1),
			 AMOptionsSlideShadowOpacity: @0.4,
			 AMOptionsBadgeShowTotal: @NO,
			 AMOptionsBadgeGlobalFont: [UIFont systemFontOfSize:8],
			 AMOptionsBadgeGlobalPositionX: @20,
			 AMOptionsBadgeGlobalPositionY: @(-5),
			 AMOptionsBadgeGlobalPositionW: @16,
			 AMOptionsBadgeGlobalPositionH: @16,
			 AMOptionsBadgeGlobalTextColor: [UIColor whiteColor],
			 AMOptionsBadgeGlobalBackColor: [UIColor redColor],
			 AMOptionsBadgeGlobalShadowColor: [UIColor clearColor]
			 };
}

@end