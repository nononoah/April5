//
//  View.m
//  April5
//
//  Created by Noah Blake on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
	
    self = [super initWithFrame:frame];
    if (self) {
    	self.backgroundColor = [UIColor whiteColor];
        CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
        
        //center the origin
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;
    
    UIFont *font = [UIFont systemFontOfSize: 21.0];
    NSString *string = NSLocalizedString(@"genusSpecies", @"displayed with drawAtPoint:");
    CGPoint point = CGPointMake(-radius, radius);
    [string drawAtPoint: point withFont: font];
    
    NSString *string2 = NSLocalizedString(@"commonName", @"displayed with drawAtPoint:");
    CGPoint point2 = CGPointMake(-radius + 5, radius + 21);
    [string2 drawAtPoint: point2 withFont: font];
    
    
    CGRect r = CGRectMake(
  		-radius,
        -radius,
        2 * radius,
        3 * radius
    );
    
    
    
   	//begin drawing
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    //reverse y-axis
    CGContextScaleCTM(c, 1, -1);
    
     //bird body
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 1.0, .2, .2, 1);
    CGContextFillPath(c);
    
    
    
    //eyestripe
    CGContextAddEllipseInRect(c, CGRectMake(0, radius * 5/6, radius * 8/9, radius/2));
    CGContextSetCMYKFillColor(c, 0, 0, 0, 1, 1);
    CGContextFillPath(c);
    
    //upper mandible + lower mandible + nares
    CGContextBeginPath(c);
    
    //set point near edge of elipse, define edges of mandible
    CGFloat mandibleEdge = radius / 4;
    CGFloat xStart = radius * 8/9;
    CGFloat yStart = radius * 7/6;
    
    //nares
    CGContextMoveToPoint(c, xStart, yStart);
    CGContextAddLineToPoint(c, xStart, yStart + mandibleEdge); //top right
    CGContextAddLineToPoint(c, xStart - mandibleEdge, yStart); //eyestripe connected
    CGContextAddLineToPoint(c, xStart, yStart - mandibleEdge); //top left
    CGContextClosePath(c);
    
    CGContextSetCMYKFillColor(c, 0, 0, 0, 1, 1);
    CGContextFillPath(c);
    
    //mandibles
    CGContextMoveToPoint(c, xStart, yStart);
    CGContextAddLineToPoint(c, xStart, yStart - mandibleEdge); //bottom left
    CGContextAddLineToPoint(c, xStart + 2 * mandibleEdge, yStart); //tip
    CGContextAddLineToPoint(c, xStart, yStart + mandibleEdge); //top left
    CGContextClosePath(c);
    
    
    CGContextSetCMYKFillColor(c, 0, .49, 1, 0, 1);
    CGContextFillPath(c);
    
    
    //divide the mandibles
    CGContextMoveToPoint(c, xStart, yStart - mandibleEdge/4);
    CGContextAddLineToPoint(c, xStart + mandibleEdge * 7/5, yStart - mandibleEdge/4);
    CGContextClosePath(c);
    CGContextSetCMYKStrokeColor(c, 0, 0, 0, 1, 1);
    CGContextStrokePath(c);

    
    //eyes
    CGContextAddEllipseInRect(c, CGRectMake(radius / 5, radius, radius/5, radius/5));
    CGContextSetCMYKFillColor(c, .66, .15, 0, 0, 1);
    CGContextFillPath(c);
    
    //wingstripe
    CGContextAddArc(c, -radius* 5/7, radius/2, 100, 0, 3 * 3.14 / 2 , 1);
    CGContextSetCMYKStrokeColor(c, 0, 0, 0, 1, 1);
    CGContextStrokePath(c);
    
    //crest
    CGContextAddArc(c, 0, radius * 5/3, 50, 0, 3 * 3.14 / 4, 0);
    CGContextSetRGBFillColor(c, 1.0, .2, .2, 1);
    CGContextFillPath(c);
}


@end
