//
//  ViewController.h
//  VideoyAlertas
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

- (IBAction)alertaSimple:(id)sender;
- (IBAction)alertaWithOptions:(id)sender;
- (IBAction)alertaSheet:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewVideo;
@property MPMoviePlayerController * reproductor;
@end
