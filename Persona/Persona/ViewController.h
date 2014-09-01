//
//  ViewController.h
//  Persona
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameUserTxt;
@property (strong, nonatomic) IBOutlet UITextField *ageUserTxt;
@property (strong, nonatomic) IBOutlet UILabel *resultUserTxt;

- (IBAction)validateUserAge:(id)sender;


@end
