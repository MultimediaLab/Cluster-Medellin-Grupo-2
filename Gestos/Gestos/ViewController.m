//
//  ViewController.m
//  Gestos
//
//  Created by Profesor on 10/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(AVAudioPlayer*)loadAudio:(NSString*)filename{
    NSURL * url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    else{
        [player prepareToPlay];
    }
    return player;
}
-(void)handleTap: (UITapGestureRecognizer*)sender{
    [_jeje play];
    UIImage * img = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * monkeyView = [[UIImageView alloc] initWithImage:img];
    monkeyView.center = CGPointMake(50, 50);
    monkeyView.userInteractionEnabled = YES;
    monkeyView.frame = CGRectMake(0, 0, 175, 130);
    [monkeyView addGestureRecognizer:_panGesture];
    [monkeyView addGestureRecognizer:_pinchGesture];
    [self.view addSubview:monkeyView];
    
    NSLog(@"%@", self.view.subviews);
}
- (IBAction)handlePinch:(id)sender {
    UIPinchGestureRecognizer * pinch = sender;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _jeje = [self loadAudio:@"hehehe1"];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];

}
- (IBAction)handlePan:(id)sender {
    UIPanGestureRecognizer * pan = sender;
    CGPoint translation = [sender translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y + translation.y);
    [pan setTranslation:CGPointMake(0, 0) inView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
