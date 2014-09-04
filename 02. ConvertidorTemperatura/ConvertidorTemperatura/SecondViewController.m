//
//  SecondViewController.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "SecondViewController.h"
#import "Temperature.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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

- (IBAction)convertToF:(id)sender {
    Temperature * temp = [[Temperature alloc] init];
    _userResult.text= [temp convertCtoF:[_userValue.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertToC:(id)sender {
    Temperature * temp = [[Temperature alloc] init];
    _userResult.text= [temp convertFtoC:[_userValue.text floatValue]];
    [self.view endEditing:YES];
    
}
@end
