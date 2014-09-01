//
//  UsuarioViewController.m
//  Segues
//
//  Created by Developer Cymetria on 25/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "UsuarioViewController.h"

@interface UsuarioViewController ()

@end

@implementation UsuarioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userName.text = _userVarScreen1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)volverButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
