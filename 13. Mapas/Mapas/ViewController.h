//
//  ViewController.h
//  Mapas
//
//  Created by Profesor on 5/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager * locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *worldView;

- (IBAction)changeMapType:(id)sender;

-(void)findLocation;
-(void)findLocation: (CLLocation*)loc;

@end
