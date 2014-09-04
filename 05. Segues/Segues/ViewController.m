//
//  ViewController.m
//  Segues
//
//  Created by Developer Cymetria on 25/08/14.
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    screen2 = [segue destinationViewController];
    screen2.userVarScreen1 = _userScreen1.text;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([_userScreen1.text isEqualToString:@"Pepe"]) {
        return YES;
    }
    return NO;
}
@end
