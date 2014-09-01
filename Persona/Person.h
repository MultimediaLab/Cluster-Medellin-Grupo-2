//
//  Person.h
//  Persona
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
    int age;
}

-(NSString*)name;
-(void) setName: (NSString*) value;

-(int)age;
-(void)setAge: (int) value;

-(BOOL) userIsAdult;

@end
