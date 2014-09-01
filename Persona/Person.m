//
//  Person.m
//  Persona
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString*)name{
    return name;
}
-(void) setName: (NSString*) value{
    name=value;
}
-(int)age{
    return age;
}
-(void)setAge: (int) value{
    age=value;
}
-(BOOL) userIsAdult{
    if (age>=18) {
        return YES;
    }
    return NO;
}
@end
