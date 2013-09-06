//
//  AMSlideOutAccessibilityDelegate.h
//  SlideOutSample
//
//  Created by Michael James on 8/27/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AMSlideTableHeader.h"

@protocol AMSlideOutAccessibilityDelegate <NSObject>

@optional
- (void)applyAccessibilityPropertiesToHeaderView: (AMSlideTableHeader*)headerView fromSection: (NSInteger)section;
- (void)applyAccessibilityPropertiesToSlideOutCell: (UITableViewCell*)slideOutCell withTag: (int)tag fromSection: (NSInteger)section;
- (void)applyAccessibilityPropertiesToSlideOutButton: (NSObject*)accessibleButton;

@end
