//
//  ViewController.m
//  ProtocoloYDelegado
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"
#import "FileAccess.h"

@interface ViewController ()<FileAccessDelegate>
@end
@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    _responseUser.text = @"";
   
}
#pragma mark Metodos de Descarga
-(void)downloadFinishLoading:(NSString *)filePath andName:(NSString *)name{
    NSLog(@"Descarga Exitosa en : %@", filePath);
    NSData *dataImg = [NSData dataWithContentsOfFile:filePath];
    _imageUser.image = [UIImage imageWithData:dataImg];
    
}
-(void)downloadDidFinishLoading:(NSString *)name{
    NSLog(@"Termino de Descargar");
}
-(void)downloadFinishLoading:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name{
    NSLog(@"Error");
}

-(void)downloadChangeLoading:(NSURLConnection *)connection didReceiveData:(NSData *)data andProgress:(float)progress{
    
    NSLog(@"%f", progress);
    _progressUser.progress = progress;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(id)sender {
    _responseUser.text = @"";
    _imageUser.hidden = NO;
   
    FileAccess * file = [[FileAccess alloc] init];
    [file descargarArchivo:_userURL.text nombre:_userName.text];
    file.delegate = self;
    
    [self.view endEditing:YES];
}

- (IBAction)deleteImage:(id)sender {
    
    _responseUser.text = [FileAccess removeFileBookWithName:_userName.text];
    
    _imageUser.hidden = YES;

}
@end
