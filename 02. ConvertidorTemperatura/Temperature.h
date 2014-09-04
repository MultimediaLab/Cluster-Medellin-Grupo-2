//
//  Temperature.h
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject
{
    float celsius;
    float farenheit;
    float kelvin;
}

-(NSString*)convertCtoF:(float)value;
-(NSString*)convertFtoC:(float)value;

@end
