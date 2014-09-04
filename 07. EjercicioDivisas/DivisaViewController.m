//
//  DivisaViewController.m
//  EjercicioDivisas
//
//  Created by Developer Cymetria on 25/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "DivisaViewController.h"

@interface DivisaViewController ()

@end

@implementation DivisaViewController

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
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"bye");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Salio");
}


- (IBAction)salirButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
