//
//  CustomCell.m
//  SlideOutSample
//
//  Created by Andrea Mazzini on 08/09/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor* startColor = [UIColor darkGrayColor];
	UIColor* endColor = [UIColor lightGrayColor];
	
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
	
	CGContextSetStrokeColorWithColor(context, ((UIColor*)[UIColor lightGrayColor]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
	
	CGContextSetStrokeColorWithColor(context, ((UIColor*)[UIColor darkGrayColor]).CGColor);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
