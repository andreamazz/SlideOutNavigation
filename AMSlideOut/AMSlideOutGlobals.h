//
//  AMSlideOutGlobals.h
//  SlideOut
//
//  Created by Andrea on 14/08/12.
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

#define kSOViewTitle		@"title"
#define kSOController		@"controller"
#define kSOViewIcon			@"icon"
#define kSOViewTag			@"tag"
#define kSOViewBadge		@"badge"
#define kSOSection			@"section"
#define kSOBeforeBlock		@"before"
#define kSOAfterBlock		@"after"
#define kSOSectionTitle		@"title"
#define kSOSectionClass		@"headerClass"
#define kSOSectionHeight	@"headerHeight"
#define kSOItemIsAction		@"isAction"

#ifndef SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#endif

FOUNDATION_EXPORT NSString *const AMOptionsEnableGesture;
FOUNDATION_EXPORT NSString *const AMOptionsEnableShadow;
FOUNDATION_EXPORT NSString *const AMOptionsSetButtonDone;
FOUNDATION_EXPORT NSString *const AMOptionsUseBorderedButton;
FOUNDATION_EXPORT NSString *const AMOptionsButtonIcon;
FOUNDATION_EXPORT NSString *const AMOptionsTableBackground;
FOUNDATION_EXPORT NSString *const AMOptionsTableOffestY;
FOUNDATION_EXPORT NSString *const AMOptionsUseDefaultTitles;

FOUNDATION_EXPORT NSString *const AMOptionsSlideValue;
FOUNDATION_EXPORT NSString *const AMOptionsBackground;
FOUNDATION_EXPORT NSString *const AMOptionsSelectionBackground;

FOUNDATION_EXPORT NSString *const AMOptionsHeaderHeight;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderFont;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderFontColor;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderShadowColor;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderPadding;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientUp;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientDown;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorUpper;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorLower;

FOUNDATION_EXPORT NSString *const AMOptionsCellFont;
FOUNDATION_EXPORT NSString *const AMOptionsCellFontColor;
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeFont;
FOUNDATION_EXPORT NSString *const AMOptionsCellBackground;
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorUpper;
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorLower;
FOUNDATION_EXPORT NSString *const AMOptionsCellShadowColor;

FOUNDATION_EXPORT NSString *const AMOptionsImagePadding;
FOUNDATION_EXPORT NSString *const AMOptionsImageLeftPadding;
FOUNDATION_EXPORT NSString *const AMOptionsImageHeight;
FOUNDATION_EXPORT NSString *const AMOptionsImageOffsetByY;
FOUNDATION_EXPORT NSString *const AMOptionsTextPadding;
FOUNDATION_EXPORT NSString *const AMOptionsBadgePosition;

FOUNDATION_EXPORT NSString *const AMOptionsDisableMenuScroll;

// Animations
FOUNDATION_EXPORT NSString *const AMOptionsAnimationShrink;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationShrinkValue;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarken;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarkenValue;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarkenColor;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationSlide;
FOUNDATION_EXPORT NSString *const AMOptionsAnimationSlidePercentage;

// Custom classes
FOUNDATION_EXPORT NSString *const AMOptionsTableHeaderClass;
FOUNDATION_EXPORT NSString *const AMOptionsTableCellClass;

FOUNDATION_EXPORT NSString *const AMOptionsTableCellHeight;
FOUNDATION_EXPORT NSString *const AMOptionsTableIconMaxSize;
FOUNDATION_EXPORT NSString *const AMOptionsSlideoutTime;
FOUNDATION_EXPORT NSString *const AMOptionsTableBadgeHeight;
FOUNDATION_EXPORT NSString *const AMOptionsSlideShadowOffset;
FOUNDATION_EXPORT NSString *const AMOptionsSlideShadowOpacity;

FOUNDATION_EXPORT NSString *const AMOptionsBadgeShowTotal;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalFont;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionX;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionY;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionW;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionH;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalTextColor;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalBackColor;
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalShadowColor;
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeFontColor;
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeBackColor;

@class AMSlideTableHeader;

@protocol AMSlideOutAccessibilityDelegate <NSObject>

@optional
- (void)applyAccessibilityPropertiesToHeaderView: (AMSlideTableHeader*)headerView fromSection: (NSInteger)section;
- (void)applyAccessibilityPropertiesToSlideOutCell: (UITableViewCell*)slideOutCell withTag: (int)tag fromSection: (NSInteger)section;
- (void)applyAccessibilityPropertiesToSlideOutButton: (NSObject*)accessibleButton;
@end

@interface AMSlideOutGlobals : NSObject

+ (NSDictionary*)defaultOptions;
+ (NSDictionary*)defaultFlatOptions;

@end