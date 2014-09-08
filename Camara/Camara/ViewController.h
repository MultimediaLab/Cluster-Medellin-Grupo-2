//
//  ViewController.h
//  Camara
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)seleccionarFoto:(id)sender;
- (IBAction)tomarFoto:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
