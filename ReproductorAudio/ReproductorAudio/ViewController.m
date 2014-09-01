//
//  ViewController.m
//  ReproductorAudio
//
//  Created by Developer Cymetria on 20/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer * progressTimer;
}
@end
@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSong:@"musica" andCover:@"Homer-Simpsons-Music-Headphones-Anime.jpg"];
    
    _containerOptions.hidden= YES;
    
    
}
- (IBAction)playButton:(id)sender {
    
    [_reproductor play];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
}

-(void)updateProgressBar{
    _progressBar.progress = _reproductor.currentTime/_reproductor.duration;
    _labelTime.text = [self timeConverter:_reproductor.currentTime];
}
-(NSString*)timeConverter:(float)value{
    int hours= (int)value/3600;
    int minuts = (int)(value/60) % 60;
    int seconds = (int)value % 60;
    return [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minuts, seconds];
}
- (IBAction)pauseButton:(id)sender {
    [_reproductor pause];
}
- (IBAction)stopButton:(id)sender {
    _reproductor.currentTime= 0;
    [_reproductor stop];
    [progressTimer invalidate];
    _progressBar.progress =0;
    _labelTime.text=@"0:00:00";
}



- (IBAction)changeOptions:(id)sender {
    UISwitch * control = sender;
    
    if (control.on) {
        _containerOptions.hidden=NO;
    }else{
        _containerOptions.hidden=YES;
    }
}

- (IBAction)changeVolume:(id)sender {
    UISlider * control = sender;
    _reproductor.volume = control.value;
}

- (IBAction)changeVelocity:(id)sender {
    _reproductor.rate = ((UISlider *) sender).value;
    [progressTimer invalidate];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1/_reproductor.rate target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
}
- (IBAction)nextSong:(id)sender {
    [self initSong:@"Unfucknbelievable" andCover:@"streaming-MP41.jpg"];
    [_reproductor play];

}
- (IBAction)prevSong:(id)sender {
    [self initSong:@"musica" andCover:@"Homer-Simpsons-Music-Headphones-Anime.jpg"];
    [_reproductor play];
}
-(void)initSong:(NSString*)nameSong andCover:(NSString*)nameImage{
    NSError * error;
    NSString * ruta = [[NSBundle mainBundle] pathForResource:nameSong ofType:@"mp3"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _imageCover.image = [UIImage imageNamed:nameImage];
    _reproductor.volume = 1;
    _reproductor.pan = 0.5;
    _reproductor.rate = 1;
    _reproductor.enableRate = YES;
    _reproductor.numberOfLoops = -1;
    _reproductor.delegate = self;
    [_reproductor prepareToPlay];
}
@end
