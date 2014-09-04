//
//  ViewController.m
//  Persona
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validateUserAge:(id)sender {
    Person * person1 = [[Person alloc] init];
    
    //[person1 setName:[NSString stringWithFormat:@"Jose Perez"]];
    //[person1 setAge:18];
    
    [person1 setName:_nameUserTxt.text];
    [person1 setAge:[_ageUserTxt.text intValue]];
    
    if ([person1 userIsAdult]) {
        //NSLog(@" %@ es adulto y tiene %d años", [person1 name], [person1 age]);
        
        _resultUserTxt.text = [NSString stringWithFormat:@" %@ es adulto y tiene %d años", [person1 name], [person1 age]];
    }else{
        //NSLog(@" %@ es menor de edad y tiene %i años", [person1 name], [person1 age]);
        
        _resultUserTxt.text = [NSString stringWithFormat:@" %@ es menor de edad y tiene %i años", [person1 name], [person1 age]];
    }
}
@end
