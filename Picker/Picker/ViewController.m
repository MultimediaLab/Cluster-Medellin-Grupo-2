///Users/profesor/Desktop/Cluster-Medellin/Grupo2/Picker/Picker/ViewController.m
//  ViewController.m
//  Picker
//
//  Created by Profesor on 27/08/14.
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
    NSString * ruta =[[NSBundle mainBundle] pathForResource:@"paises" ofType:@"plist"];
    _paises = [[NSArray alloc] initWithContentsOfFile:ruta];
    [_pickerPaises selectRow:([_paises count]/2) inComponent:0 animated:YES];
    
    NSLog(@"%@", _paises);
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_paises count];

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [_paises objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Seleccion"
                                                      message:[_paises objectAtIndex:row]
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles: nil];
    [alerta show];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
