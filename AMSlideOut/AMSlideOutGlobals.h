//
//  AMSlideOutGlobals.h
//  SlideOut
//
//  Created by Andrea on 14/08/12.
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

#define kSOViewTitle            @"title"
#define kSOController           @"controller"
#define kSOViewIcon             @"icon"
#define kSOViewSelectionIcon    @"selectionIcon"
#define kSOViewTag              @"tag"
#define kSOViewBadge            @"badge"
#define kSOSection              @"section"
#define kSOBeforeBlock          @"before"
#define kSOAfterBlock           @"after"
#define kSOSectionTitle         @"title"
#define kSOSectionClass         @"headerClass"
#define kSOSectionHeight        @"headerHeight"
#define kSOItemIsAction         @"isAction"
#define kSOItemClass            @"itemClass"
#define kSOItemNibName          @"itemNibName"

/// This is to support prior versions where there was a typo in this option definition:
#define AMOptionsTableOffestY AMOptionsTableOffsetY

#ifndef SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#endif

#pragma mark - Options

/** Enable pan gesture */
FOUNDATION_EXPORT NSString *const AMOptionsEnableGesture;

/** Enable shadow */
FOUNDATION_EXPORT NSString *const AMOptionsEnableShadow;

/** Enable Done button */
FOUNDATION_EXPORT NSString *const AMOptionsSetButtonDone;

/** Show bordered button */
FOUNDATION_EXPORT NSString *const AMOptionsUseBorderedButton;

/** Menu button icon */
FOUNDATION_EXPORT NSString *const AMOptionsButtonIcon;

/** Background for the image button */
FOUNDATION_EXPORT NSString *const AMOptionsNavBarImage;

/** Table's background */
FOUNDATION_EXPORT NSString *const AMOptionsTableBackground;

/** Vertical offset for the table */
FOUNDATION_EXPORT NSString *const AMOptionsTableOffsetY;

/** Horizontal inset for the table */
FOUNDATION_EXPORT NSString *const AMOptionsTableInsetX;

/** Set the title on transition */
FOUNDATION_EXPORT NSString *const AMOptionsUseDefaultTitles;

/** Slide offset to snap the menu in place */
FOUNDATION_EXPORT NSString *const AMOptionsSlideValue;

/** Cell background */
FOUNDATION_EXPORT NSString *const AMOptionsBackground;

/** Selected cell background */
FOUNDATION_EXPORT NSString *const AMOptionsSelectionBackground;

/** Header height */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderHeight;

/** Header font */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderFont;

/** Header font color */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderFontColor;

/** HEader shadow color */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderShadowColor;

/** Header padding */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderPadding;

/** Header gradient start */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientUp;

/** Header gradient stop */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientDown;

/** Cell upper separator */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorUpper;

/** Cell lower separator */
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorLower;

/** Cell font */
FOUNDATION_EXPORT NSString *const AMOptionsCellFont;

/** Cell font color */
FOUNDATION_EXPORT NSString *const AMOptionsCellFontColor;

/** Selected cell font color */
FOUNDATION_EXPORT NSString *const AMOptionsCellSelectionFontColor;

/** Cell badge font */
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeFont;

/** Cell background */
FOUNDATION_EXPORT NSString *const AMOptionsCellBackground;

/** Cell separator */
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorUpper;

/** Cell lower separator */
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorLower;

/** Separator for the cell below the header */
FOUNDATION_EXPORT NSString *const AMOptionsShowCellSeparatorLowerBeforeHeader;

/** Cell shadow color */
FOUNDATION_EXPORT NSString *const AMOptionsCellShadowColor;

/** Image padding */
FOUNDATION_EXPORT NSString *const AMOptionsImagePadding;

/** Image left padding */
FOUNDATION_EXPORT NSString *const AMOptionsImageLeftPadding;

/** Image height */
FOUNDATION_EXPORT NSString *const AMOptionsImageHeight;

/** Image vertical offset */
FOUNDATION_EXPORT NSString *const AMOptionsImageOffsetByY;

/** Text padding */
FOUNDATION_EXPORT NSString *const AMOptionsTextPadding;

/** Badge position */
FOUNDATION_EXPORT NSString *const AMOptionsBadgePosition;

/** Block menu scroll */
FOUNDATION_EXPORT NSString *const AMOptionsDisableMenuScroll;

#pragma mark - Animation Options

/** Shrink animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationShrink;

/** Value for the shrink animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationShrinkValue;

/** Darken animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarken;

/** Value for the darken animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarkenValue;

/** Color for the darken animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationDarkenColor;

/** Slide animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationSlide;

/** Value of the slide animation */
FOUNDATION_EXPORT NSString *const AMOptionsAnimationSlidePercentage;

#pragma mark - Custom classes

/** Header class */
FOUNDATION_EXPORT NSString *const AMOptionsTableHeaderClass;

/** Table class */
FOUNDATION_EXPORT NSString *const AMOptionsTableCellClass;

/** Cell height */
FOUNDATION_EXPORT NSString *const AMOptionsTableCellHeight;

/** Icon max size */
FOUNDATION_EXPORT NSString *const AMOptionsTableIconMaxSize;

/** Slide out duration */
FOUNDATION_EXPORT NSString *const AMOptionsSlideoutTime;

/** Badge height for the table items */
FOUNDATION_EXPORT NSString *const AMOptionsTableBadgeHeight;

/** Shadow offset */
FOUNDATION_EXPORT NSString *const AMOptionsSlideShadowOffset;

/** Shadow opacity */
FOUNDATION_EXPORT NSString *const AMOptionsSlideShadowOpacity;

/** Show total badge value */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeShowTotal;

/** Font for the global badge */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalFont;

/** Horizontal position for the badge */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionX;

/** Vertical position for the badge */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionY;

/** Width for the badge */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionW;

/** Height for the badge */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalPositionH;

/** Badge corner radius */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalCornerRadius;

/** Badge text color */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalTextColor;

/** Badge shadow text color */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalBackColor;

/** Badge shadow color */
FOUNDATION_EXPORT NSString *const AMOptionsBadgeGlobalShadowColor;

/** Badge font color */
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeFontColor;

/** Badge background color */
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeBackColor;

/** Set the navbar as translucent */
FOUNDATION_EXPORT NSString *const AMOptionsNavbarTranslucent;

/** Top inset for the content */
FOUNDATION_EXPORT NSString *const AMOptionsContentInsetTop;

/** Hide navbar */
FOUNDATION_EXPORT NSString *const AMOptionsNavBarHidden;

#pragma mark - Notifications

#define kAMSlideOutMenuWillShow     @"SlideOutMenuWillShow"
#define kAMSlideOutDidShow			@"SlideOutMenuDidShow"
#define kAMSlideOutWillHide			@"SlideOutMenuWillHide"
#define kAMSlideOutDidHide			@"SlideOutMenuDidHide"

@class AMSlideTableHeader;

/** @protocol AMSlideOutAccessibilityDelegate
 * Slideout delegate
 */
@protocol AMSlideOutAccessibilityDelegate <NSObject>

@optional

/**
 * Applies accessibility properties to the header
 *
 * @param headerView the header
 * @param section the index of the section
 */
- (void)applyAccessibilityPropertiesToHeaderView:(AMSlideTableHeader *)headerView fromSection:(NSInteger)section;

/**
 * Applies accessibility properties to the slideOut cell
 *
 * @param slideOutCell The cell
 * @param tag the tag of the cell
 * @param section the index of the section
 */
- (void)applyAccessibilityPropertiesToSlideOutCell:(UITableViewCell *)slideOutCell withTag:(NSInteger)tag fromSection:(NSInteger)section;

/**
 * Applies accessibility properties to the button
 *
 * @param accessibleButton the button
 */
- (void)applyAccessibilityPropertiesToSlideOutButton:(NSObject *)accessibleButton;

@end

/**
 * Global options
 */
@interface AMSlideOutGlobals : NSObject

/**
 * Default options
 *
 * @returns NSDictionary
 */
+ (NSDictionary*)defaultOptions;

/**
 * Global options with a flat appearance
 *
 * @returns NSDictionary
 */
+ (NSDictionary*)defaultFlatOptions;

@end
