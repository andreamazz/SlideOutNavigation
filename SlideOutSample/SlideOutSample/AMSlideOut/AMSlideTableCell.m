//
//  AMSlideTableCell.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableCell.h"
#import "AMSlideOutGlobals.h"

#define kMaxImageHeight 44.f
#ifdef __IPHONE_6_0
# define kTextAlignmentCenter NSTextAlignmentCenter
#else
# define kTextAlignmentCenter UITextAlignmentCenter
#endif


@interface AMSlideTableCell()

@property (nonatomic, strong) UILabel*	badge;

@end

@implementation AMSlideTableCell

@synthesize badge = _badgeValue;

- (void)layoutSubviews
{
	self.textLabel.backgroundColor = [UIColor clearColor];
	self.textLabel.textColor = self.options[AMOptionsCellFontColor];
	self.textLabel.shadowOffset = CGSizeMake(0, 1);
	self.textLabel.shadowColor = self.options[AMOptionsCellShadowColor];
	self.textLabel.font = self.options[AMOptionsCellFont];
	
	if (self.imageView.image) {
        CGFloat imageOffsetByY = [self.options[AMOptionsImageOffsetByY] floatValue];
        CGFloat imageHeight = [self.options[AMOptionsImageHeight] floatValue];
        
        if (imageHeight > kMaxImageHeight) {
            imageHeight = kMaxImageHeight;
        }
        
		self.imageView.frame = CGRectMake(0, imageOffsetByY, 44, imageHeight);
		self.textLabel.frame = CGRectMake([self.options[AMOptionsImagePadding] floatValue], 0, [self.options[AMOptionsSlideValue] floatValue] - [self.options[AMOptionsImagePadding] floatValue], imageHeight);
	} else {
		self.textLabel.frame = CGRectMake([self.options[AMOptionsTextPadding] floatValue], 0, [self.options[AMOptionsSlideValue] floatValue] - [self.options[AMOptionsTextPadding] floatValue], 44);
	}
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
	
	// Set badge properties
	if (self.badge == nil) {
		self.badge = [[UILabel alloc] init];
		[self addSubview:self.badge];
	}
	self.badge.font = self.options[AMOptionsCellBadgeFont];
	self.badge.textColor = self.options[AMOptionsCellFontColor];
	self.badge.adjustsFontSizeToFitWidth = YES;
	self.badge.textAlignment = kTextAlignmentCenter;
	self.badge.opaque = YES;
	self.badge.backgroundColor = [UIColor clearColor];
	self.badge.shadowOffset = CGSizeMake(0, 1);
	self.badge.shadowColor = self.options[AMOptionsCellShadowColor];
	self.badge.layer.cornerRadius = 8;
	self.badge.layer.backgroundColor = [[UIColor blackColor] CGColor];
}

- (void)setBadgeText:(NSString*)text
{
	if (text == nil || [text isEqualToString:@""]) {
		[self.badge setAlpha:0];
	} else {
		CGSize fontSize = [text sizeWithFont:self.options[AMOptionsCellBadgeFont]];
		CGRect badgeFrame = CGRectMake([self.options[AMOptionsBadgePosition] floatValue] - (fontSize.width + 15.0) / 2.0, 12, fontSize.width + 15.0, 20);
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
	
	CGContextSetFillColorWithColor(context, ((UIColor*)self.options[AMOptionsCellBackground]).CGColor);
	CGContextFillRect(context, self.bounds);
	
	CGContextSetStrokeColorWithColor(context, ((UIColor*)self.options[AMOptionsCellSeparatorUpper]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
    
	CGContextSetStrokeColorWithColor(context, ((UIColor*)self.options[AMOptionsCellSeparatorLower]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
