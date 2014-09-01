//
//  PintorView.h
//  Dibujo
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface PintorView : UIView


@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property UIColor * currentColor;
@property ShapeType shapeType;
@property ColorTabIndex colorTabIndex;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@property UIImage * drawImage;
@property BOOL useRandomColor;



@end
