//
//  Temperature.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Temperature.h"

@implementation Temperature


-(NSString*)convertCtoF:(float)value{
    farenheit = value*9/5+32;
    return [NSString stringWithFormat:@"%.02f ºF", farenheit];
}
-(NSString*)convertFtoC:(float)value{
    celsius = (value-32)/1.8000;
    return [NSString stringWithFormat:@"%0.2f ºC", celsius];
}

@end
