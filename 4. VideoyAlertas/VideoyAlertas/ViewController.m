//
//  ViewController.m
//  VideoyAlertas
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIAlertView * alerta;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString * ruta= [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    
    _reproductor.view.frame = CGRectMake(0, 0, 280, 170);
    
    [_viewVideo addSubview:_reproductor.view];
    
    [_reproductor play];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertaSimple:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error"
                                        message:@"Esta es una alerta de error"
                                       delegate:self
                              cancelButtonTitle:@"Cancelar"
                              otherButtonTitles:@"Aceptar", nil];
    [alerta show];
    alerta.tag = 1;
}

- (IBAction)alertaWithOptions:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error"
                                        message:@"Esta es una alerta de error"
                                       delegate:self
                              cancelButtonTitle:@"Cancelar"
                              otherButtonTitles:@"Aceptar", nil];
    alerta.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alerta show];
    alerta.tag = 2;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%i", buttonIndex);
    if (alertView.tag==2 && buttonIndex==1) {
        NSLog(@"Usuario: %@", [alertView textFieldAtIndex:0].text);
        NSLog(@"Contraseña: %@", [alertView textFieldAtIndex:1].text);
    }
}

- (IBAction)alertaSheet:(id)sender {
    UIActionSheet * action = [[UIActionSheet alloc] initWithTitle:@"Opciones"
                                                         delegate:self
                                                cancelButtonTitle:@"Cerrar"
                                           destructiveButtonTitle:@"Eliminar"
                                                otherButtonTitles:@"Aceptar", nil];
    [action showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

}
@end
