//
//  UsuarioViewController.h
//  Segues
//
//  Created by Developer Cymetria on 25/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsuarioViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userName;
@property NSString * userVarScreen1;

- (IBAction)volverButton:(id)sender;

@end
