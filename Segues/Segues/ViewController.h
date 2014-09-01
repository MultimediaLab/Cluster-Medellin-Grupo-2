//
//  ViewController.h
//  Segues
//
//  Created by Developer Cymetria on 25/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioViewController.h"

@interface ViewController : UIViewController
{
    UsuarioViewController * screen2;

}
@property (strong, nonatomic) IBOutlet UITextField *userScreen1;

@end
