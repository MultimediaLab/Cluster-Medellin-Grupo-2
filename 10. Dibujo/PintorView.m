//
//  PintorView.m
//  Dibujo
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "PintorView.h"
#import "UIColor+Random.h"

@implementation PintorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y - _firstTouch.y);
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_useRandomColor == YES) {_currentColor = [UIColor randomColor];}
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    switch (_colorTabIndex) {
        case kRedColorTab:
            _currentColor = [UIColor redColor];
            _useRandomColor = NO;
        break;
        case kYellowColorTab:
            _currentColor = [UIColor yellowColor];
            _useRandomColor = NO;
        break;
        case kBlueColorTab:
            _currentColor = [UIColor blueColor];
            _useRandomColor = NO;
        break;
        case kGreenColorTab:
            _currentColor = [UIColor greenColor];
            _useRandomColor = NO;
        break;
        case kRandomColorTab:
            _useRandomColor = YES;
        break;
            
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
        break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
        break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
        break;
        case kImageShape:{
            CGFloat horizontalOffset = _drawImage.size.width/2;
            CGFloat verticalOffset = _drawImage.size.height /2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x - horizontalOffset, _lastTouch.y -verticalOffset);
            
            [_drawImage drawAtPoint:drawPoint];
        }
        break;
            
    }
   
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _drawImage = [UIImage imageNamed:@"Apple.png"];
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
    }
    return self;
}





-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    
    //Refresh en el View
    [self setNeedsDisplayInRect:_redrawRect];

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    _redrawRect = CGRectInset(_redrawRect, -2.0, -2.0);
    
    //Refresh en el View
    [self setNeedsDisplayInRect:_redrawRect];

}
@end
