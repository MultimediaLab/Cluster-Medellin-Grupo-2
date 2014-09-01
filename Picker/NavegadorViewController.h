//
//  NavegadorViewController.h
//  Picker
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavegadorViewController : UIViewController <UIWebViewDelegate>

- (IBAction)htmlButton:(id)sender;
- (IBAction)jsButton:(id)sender;
- (IBAction)webButton:(id)sender;
- (IBAction)pdfButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *navegador;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *cargando;

@end
