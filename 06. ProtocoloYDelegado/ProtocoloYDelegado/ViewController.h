//
//  ViewController.h
//  ProtocoloYDelegado
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIProgressView *progressUser;
@property (strong, nonatomic) IBOutlet UIImageView *imageUser;


@property (strong, nonatomic) IBOutlet UITextField *userURL;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UILabel *responseUser;

- (IBAction)downloadImage:(id)sender;
- (IBAction)deleteImage:(id)sender;

@end
