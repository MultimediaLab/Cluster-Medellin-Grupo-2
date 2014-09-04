//
//  ViewController.m
//  Animaciones
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    //RectMake (x, y, ancho, alto)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animar:(id)sender {
    UISwitch * control = sender;
    
    if (control.on) {
        [UIView animateWithDuration:1.0 animations:^{
            _view1.frame = CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 165);
            _view1.alpha = 1.0;
        }];
    }
    else{
        [UIView animateWithDuration:1.0 animations:^{
            _view1.frame = CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 10);
            _view1.alpha = 0;
        }];
        
    }

}

- (IBAction)animarDoble:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        _view2.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            _view2.frame = CGRectMake(_view2.frame.origin.x, _view2.frame.origin.y, _view2.frame.size.width, 10);
        }];
    }];
}

- (IBAction)animarConOpciones:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse   animations:^{
        _view2.alpha = 0;
    } completion:^(BOOL finished) {
        
        
    }];
}

- (IBAction)stop:(id)sender {
    [_view2.layer removeAllAnimations];
    [_view1.layer removeAllAnimations];
    
}









@end
