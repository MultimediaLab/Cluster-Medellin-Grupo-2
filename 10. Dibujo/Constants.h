//
//  Constants.h
//  Dibujo
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#ifndef Dibujo_Constants_h
#define Dibujo_Constants_h

typedef enum {
    kLineShape = 0,
    kEllipseShape,
    kRectShape,
    kImageShape
} ShapeType;

typedef enum {
    kRedColorTab = 0,
    kYellowColorTab,
    kBlueColorTab,
    kGreenColorTab,
    kRandomColorTab
} ColorTabIndex;

#define degressToRadian(x) (M_PI * (x) / 180.0)

#endif
