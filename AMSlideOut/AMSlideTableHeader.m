//
//  AMSlideTableHeader.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableHeader.h"
#import "AMSlideOutGlobals.h"

@implementation AMSlideTableHeader

- (id)init {
    if ((self = [super init])) {
		self.titleLabel = [[UILabel alloc] init];
		[self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
	self.titleLabel.backgroundColor = [UIColor clearColor];
	self.titleLabel.font = self.options[AMOptionsHeaderFont];
	self.titleLabel.textColor = self.options[AMOptionsHeaderFontColor];
	self.titleLabel.shadowColor = self.options[AMOptionsHeaderShadowColor];
	self.titleLabel.shadowOffset = CGSizeMake(0, 1);
    self.titleLabel.frame = CGRectMake([self.options[AMOptionsHeaderPadding] floatValue], 0, [self.options[AMOptionsSlideValue] floatValue] - [self.options[AMOptionsHeaderPadding] floatValue], self.bounds.size.height);
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor* startColor = self.options[AMOptionsHeaderGradientUp];
	UIColor* endColor = self.options[AMOptionsHeaderGradientDown];
		
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
	
    NSArray *colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
	
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,	(__bridge CFArrayRef)colors, locations);
	
	CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
	
	CGContextSaveGState(context);
	CGContextAddRect(context, rect);
	CGContextClip(context);
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGContextRestoreGState(context);
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);
	
	CGContextSetStrokeColorWithColor(context, ((UIColor*)self.options[AMOptionsHeaderSeparatorUpper]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
	
	CGContextSetStrokeColorWithColor(context, ((UIColor*)self.options[AMOptionsHeaderSeparatorLower]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
