//
//  ViewController.m
//  Camara
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
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El dispositivo no tiene camara disponible" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alerta show];
    }
	
}
- (IBAction)tomarFoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [picker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage * imagenCapturada = info[UIImagePickerControllerOriginalImage];
    _imageView.image = imagenCapturada;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(imagenCapturada, nil, nil, nil);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)seleccionarFoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
