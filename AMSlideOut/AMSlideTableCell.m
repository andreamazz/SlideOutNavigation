//
//  AMSlideTableCell.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableCell.h"
#import "AMSlideOutGlobals.h"

@interface AMSlideTableCell()

@property (nonatomic, strong) UILabel*	badge;
@property (nonatomic, strong) UIView*	upperBorder;
@property (nonatomic, strong) UIView*	lowerBorder;

@end

@implementation AMSlideTableCell

@synthesize badge = _badgeValue;
@synthesize upperBorder = _upperBorder;
@synthesize lowerBorder = _lowerBorder;

- (UIView *) upperBorder {
    
    if (!_upperBorder) {
        _upperBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 1.0)];
        _upperBorder.backgroundColor = self.options[AMOptionsCellSeparatorUpper];
    }
    return _upperBorder;
}

- (UIView *) lowerBorder {
    
    if (!_lowerBorder) {
        _lowerBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 1.0)];
        _lowerBorder.backgroundColor = self.options[AMOptionsCellSeparatorLower];
    }
    return _lowerBorder;
}

- (void)layoutSubviews
{

    [self addSubview:self.upperBorder];
    [self addSubview:self.lowerBorder];
    
	self.textLabel.backgroundColor = [UIColor clearColor];
	self.textLabel.textColor = self.options[AMOptionsCellFontColor];
	self.textLabel.shadowOffset = CGSizeMake(0, 1);
	self.textLabel.shadowColor = self.options[AMOptionsCellShadowColor];
	self.textLabel.font = self.options[AMOptionsCellFont];
	[self setBackgroundColor:self.options[AMOptionsCellBackground]];
	if (self.imageView.image) {
        CGFloat imageOffsetByY = [self.options[AMOptionsImageOffsetByY] floatValue];
        CGFloat imageHeight = [self.options[AMOptionsImageHeight] floatValue];
        
        if (imageHeight > [self.options[AMOptionsTableIconMaxSize] floatValue]) {
            imageHeight = [self.options[AMOptionsTableIconMaxSize] floatValue];
        }
        
		self.imageView.frame = CGRectMake([self.options[AMOptionsImageLeftPadding] floatValue], imageOffsetByY, [self.options[AMOptionsTableIconMaxSize] floatValue], imageHeight);
		self.textLabel.frame = CGRectMake([self.options[AMOptionsImagePadding] floatValue], 0, [self.options[AMOptionsSlideValue] floatValue] - [self.options[AMOptionsImagePadding] floatValue], [self.options[AMOptionsTableCellHeight] floatValue]);
	} else {
		self.textLabel.frame = CGRectMake([self.options[AMOptionsTextPadding] floatValue], 0, [self.options[AMOptionsSlideValue] floatValue] - [self.options[AMOptionsTextPadding] floatValue], [self.options[AMOptionsTableCellHeight] floatValue]);
	}
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
	
	// Set badge properties
	self.badge.font = self.options[AMOptionsCellBadgeFont];
	self.badge.textColor = self.options[AMOptionsCellBadgeFontColor];
	self.badge.adjustsFontSizeToFitWidth = YES;
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
		self.badge.textAlignment = NSTextAlignmentCenter;
	} else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
		self.badge.textAlignment = UITextAlignmentCenter;
#pragma clang diagnostic pop
	}
	self.badge.opaque = YES;
	self.badge.backgroundColor = [UIColor clearColor];
	self.badge.shadowOffset = CGSizeMake(0, 1);
	self.badge.shadowColor = self.options[AMOptionsCellShadowColor];
	self.badge.layer.cornerRadius = 8;
	self.badge.layer.backgroundColor = [self.options[AMOptionsCellBadgeBackColor] CGColor];
}

- (UILabel*)badge
{
	if (_badgeValue == nil) {
		_badgeValue = [[UILabel alloc] init];
		[self addSubview:_badgeValue];
	}
	return _badgeValue;
}

- (void)setBadgeText:(NSString*)text
{
	if (text == nil || [text isEqualToString:@""]) {
		[self.badge setAlpha:0];
	} else {
		CGSize fontSize;
#ifdef __IPHONE_7
		if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
			fontSize = [text sizeWithAttributes: @{NSFontAttributeName: self.options[AMOptionsCellBadgeFont]}];
		} else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
			fontSize = [text sizeWithFont:self.options[AMOptionsCellBadgeFont]];
#pragma clang diagnostic pop
		}
#else
		fontSize = [text sizeWithFont:self.options[AMOptionsCellBadgeFont]];
#endif
		float y = [self.options[AMOptionsTableCellHeight] floatValue] / 2 - [self.options[AMOptionsTableBadgeHeight] floatValue] / 2;
		CGRect badgeFrame = CGRectMake([self.options[AMOptionsBadgePosition] floatValue] - (fontSize.width + 15.0) / 2.0,
									   y,
									   fontSize.width + 15.0,
									   [self.options[AMOptionsTableBadgeHeight] floatValue]);
		self.badge.frame = badgeFrame;
		self.badge.text = text;
		[self.badge setAlpha:1];
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)drawRect:(CGRect)aRect
{
	[self setBackgroundColor:self.options[AMOptionsCellBackground]];
	
}

@end
