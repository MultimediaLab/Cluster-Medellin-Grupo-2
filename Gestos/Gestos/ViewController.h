//
//  ViewController.h
//  Gestos
//
//  Created by Profesor on 10/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *mico;

@property AVAudioPlayer * chomp;
@property AVAudioPlayer * jeje;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;

- (IBAction)handlePan:(id)sender;
- (IBAction)handlePinch:(id)sender;


@end

