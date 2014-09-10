//
//  ViewController.m
//  JSON
//
//  Created by Profesor on 10/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

#define kJSONURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]
#define kQueue  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userOutput.hidden = YES;
    _jsonOutput.hidden = YES;
    [_animacion startAnimating];

    dispatch_async(kQueue, ^{
        NSData * data = [NSData dataWithContentsOfURL:kJSONURL];
        [self performSelectorOnMainThread:@selector(imprimirDatos:) withObject:data waitUntilDone: YES];
    });
}

-(void)imprimirDatos:(NSData *)responseData{
    _userOutput.hidden = NO;
    _jsonOutput.hidden = NO;
    [_animacion stopAnimating];
    _animacion.hidden = YES;
    
    NSError * error;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSArray * bloqueLoans = [json objectForKey:@"loans"];
    NSDictionary * registro = [bloqueLoans objectAtIndex:0];
    
    //NSLog(@"%@", registro);
    
    NSNumber * registro_id = [registro objectForKey:@"id"];
    NSString * registro_nombre = [registro objectForKey:@"name"];
    NSString * registro_actividad = [registro objectForKey:@"activity"];
    NSString * registro_fecha = [registro objectForKey:@"posted_date"];
    
    _userOutput.text = [NSString stringWithFormat:@"El registro %@, corresponde al usuario %@, que se encuentra en la actividad %@ y su fecha de ingreso fue %@", registro_id, registro_nombre, registro_actividad, registro_fecha];
    
    /////////
    NSDictionary * infoJSON = [NSDictionary dictionaryWithObjectsAndKeys:registro_nombre, @"nombre", registro_id, @"id", registro_actividad, @"actividad", registro_fecha, @"fecha", nil];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:infoJSON options:kNilOptions error:&error];
    _jsonOutput.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
