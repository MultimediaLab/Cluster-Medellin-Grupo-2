//
//  MapPoint.m
//  Mapas
//
//  Created by Profesor on 5/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor title:(NSString *)ti{
    self= [super init];
    if (self) {
        _coordinate = coor;
        _title = ti;
    }
    return self;
}
-(id)init{
    //Medellin:
    //LATITUD: 6,235925
    //LONGITUD: -75,57513
    return [self initWithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) title:@"Medellin"];

}
@end
