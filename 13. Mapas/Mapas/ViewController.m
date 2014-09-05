//
//  ViewController.m
//  Mapas
//
//  Created by Profesor on 5/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locationManager startUpdatingLocation];

    
    _worldView.delegate = self;
    [_worldView setShowsUserLocation:YES];
    
    [self findLocation];
    
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [_worldView setRegion:region animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation * newLocation = [locations lastObject];
    CLLocation * oldLocation;
    if (locations.count>1) {
        oldLocation = [locations objectAtIndex:locations.count-2];
    }
    else{
        oldLocation= nil;
    }
    [self findLocation:newLocation];
}



- (IBAction)changeMapType:(id)sender {
    int index = [sender selectedSegmentIndex];
    switch (index) {
        case 0:
            [_worldView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [_worldView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [_worldView setMapType:MKMapTypeHybrid];
            break;
    }
}
-(void)findLocation{
    MapPoint * puntoIni = [[MapPoint alloc] init];
    [_worldView addAnnotation:puntoIni];
}
-(void)findLocation:(CLLocation *)loc{
    CLLocationCoordinate2D cood = [loc coordinate];
    MapPoint * ruta = [[MapPoint alloc] initWithCoordinate:cood title:@"Moviendome"];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cood, 500, 500);
    [_worldView setRegion:region animated:YES];
    [_worldView addAnnotation:ruta];
}
@end
