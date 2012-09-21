//
//  AMSlideTableCell.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableCell.h"
#import "AMSlideOutGlobals.h"

#define kBadgeFont		[UIFont fontWithName:@"Helvetica" size:12]

@implementation AMSlideTableCell

@synthesize badge = _badgeValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.textLabel.textColor = kCellFontColor;
		self.textLabel.shadowOffset = CGSizeMake(0, 1);
		self.textLabel.shadowColor = kFontShadowColor;
		self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
		
		self.badge = [[UILabel alloc] init];
		
		[self addSubview:self.badge];
    }
    return self;
}

- (void)layoutSubviews
{
	if (self.imageView.image) {
		self.imageView.frame = CGRectMake(0, 0, 44, 44);
		self.textLabel.frame = CGRectMake(kImagePadding, 0, kSlideValue - kImagePadding, 44);
	} else {
		self.textLabel.frame = CGRectMake(kTextPadding, 0, kSlideValue - kTextPadding, 44);
	}
	
	// Set badge properties
	self.badge.font = kBadgeFont;
	self.badge.textColor = kCellFontColor;
	self.badge.adjustsFontSizeToFitWidth = YES;
	self.badge.textAlignment = UITextAlignmentCenter;
	self.badge.opaque = YES;
	self.badge.backgroundColor = [UIColor clearColor];
	self.badge.shadowOffset = CGSizeMake(0, 1);
	self.badge.shadowColor = kFontShadowColor;
	
	self.badge.layer.cornerRadius = 8;
	self.badge.layer.backgroundColor = [[UIColor blackColor] CGColor];
}

- (void)setBadgeText:(NSString*)text
{
	if (text == nil || [text isEqualToString:@""]) {
		[self.badge setAlpha:0];
	} else {
		CGSize fontSize = [text sizeWithFont:kBadgeFont];
		CGRect badgeFrame = CGRectMake(kBadgePosition - (fontSize.width + 15.0) / 2.0, 12, fontSize.width + 15.0, 20);
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
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, kCellBackground);
	CGContextFillRect(context, self.bounds);
	
	CGContextSetStrokeColorWithColor(context, kUpperSeparator);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
	
	CGContextSetStrokeColorWithColor(context, kLowerSeparator);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
