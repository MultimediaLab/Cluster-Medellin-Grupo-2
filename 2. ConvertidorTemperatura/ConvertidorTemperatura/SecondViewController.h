//
//  SecondViewController.h
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userValue;
@property (strong, nonatomic) IBOutlet UILabel *userResult;
- (IBAction)convertToF:(id)sender;
- (IBAction)convertToC:(id)sender;

@end
