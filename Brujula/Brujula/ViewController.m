//
//  ViewController.m
//  Brujula
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingHeading];
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    float oldRad = -manager.heading.trueHeading*M_PI/180.0f;
    float newRad = -newHeading.trueHeading*M_PI/180.0f;
    
    NSLog(@"old: %f, new: %f", oldRad, newRad);

    CABasicAnimation * theAnimation;
    
    theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theAnimation.fromValue = [NSNumber numberWithFloat:oldRad];
    theAnimation.toValue = [NSNumber numberWithFloat:newRad];
 
    theAnimation.duration = 0.5f;
    
    [_compassImage.layer addAnimation:theAnimation forKey:@"animateRotation"];
    _compassImage.transform = CGAffineTransformMakeRotation(newRad);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
