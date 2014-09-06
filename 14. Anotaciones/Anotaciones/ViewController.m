//
//  ViewController.m
//  Anotaciones
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
	_mapView.delegate = self;
    
    //BOGOTA
    CLLocationCoordinate2D coor1;
    coor1.latitude = 4.60971;
    coor1.longitude = -74.08175;
    MapPoint * punto1 = [[MapPoint alloc] initWithCoordinate:coor1 title:@"Bogotá"];
    [_mapView addAnnotation:punto1];
    
    //MEDELLIN
    CLLocationCoordinate2D coor2;
    coor2.latitude = 6.21667;
    coor2.longitude = -75.5667;
    MapPoint * punto2 = [[MapPoint alloc] initWithCoordinate:coor2 title:@"Medellin"];
    [_mapView addAnnotation:punto2];
    
    //MANIZALES
    CLLocationCoordinate2D coor3;
    coor3.latitude = 5.07;
    coor3.longitude = -75.52056;
    MapPoint * punto3 = [[MapPoint alloc] initWithCoordinate:coor3 title:@"Manizales"];
    [_mapView addAnnotation:punto3];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    MKCoordinateRegion region;
    region.center.latitude = 4.60971;
    region.center.longitude = -74.08175;
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    [_mapView setRegion:region animated:YES];

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    MKAnnotationView * annotationView;
    
    Flag * flagview = [[[NSBundle mainBundle] loadNibNamed:@"Flag" owner:self options:nil] objectAtIndex:0];
    annotationView = flagview;
    
    annotationView.centerOffset = CGPointMake(annotationView.frame.size.width/2, -annotationView.frame.size.height/2);
    
    return annotationView;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
