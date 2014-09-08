//
//  ViewController.m
//  Lineas y Distancias
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
	//Politecnico 6.210243,-75.5772957
    // Mi casa: 6.2174563,-75.5685331
    
    _mapView.delegate= self;
    
    
    CLLocation * poli = [[CLLocation alloc] initWithLatitude:6.210243 longitude:-75.5772957];
    MapPoint * poli_point = [[MapPoint alloc] initWithCoordinate:[poli coordinate] title:@"Politecnico"];
    
    CLLocation * casa = [[CLLocation alloc] initWithLatitude:6.2174563 longitude:-75.5685331];
    MapPoint * casa_point = [[MapPoint alloc] initWithCoordinate:[casa coordinate] title:@"Mi Casa"];
    
    [_mapView addAnnotations:[NSArray arrayWithObjects:poli_point, casa_point, nil]];
    
    
    //Distancia entre Poli y mi casa
    CLLocationDistance distancia = [poli distanceFromLocation:casa];
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Distancia" message:[NSString stringWithFormat:@"La distancia es: %.02f m \nkilometros : %.02f km", distancia,distancia/1000] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
    
    //Trazando la Linea entre los puntos
    MKMapPoint * points = malloc(sizeof(CLLocationCoordinate2D)*2);
    points[0]= MKMapPointForCoordinate([poli coordinate]);
    points[1]= MKMapPointForCoordinate([casa coordinate]);
    linea = [MKPolyline polylineWithPoints:points count:2];
    [_mapView addOverlay:linea];
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolyline * ruta = overlay;
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:ruta];
    rutaRender.strokeColor = [UIColor redColor];
    rutaRender.lineWidth = 1;
    rutaRender.lineDashPattern =  [NSArray arrayWithObjects:[NSNumber numberWithFloat:2],[NSNumber numberWithFloat:2], nil];
    return rutaRender;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    MKCoordinateRegion region;
    region.center.latitude = 6.2137415;
    region.center.longitude = -75.5740826;
    region.span.latitudeDelta= 0.02;
    region.span.longitudeDelta = 0.02;
    [_mapView setRegion:region];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
