//
//  ViewController.h
//  Animaciones
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

- (IBAction)animar:(id)sender;
- (IBAction)animarDoble:(id)sender;
- (IBAction)animarConOpciones:(id)sender;
- (IBAction)stop:(id)sender;
@end
