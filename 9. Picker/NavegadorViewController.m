//
//  NavegadorViewController.m
//  Picker
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

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

- (IBAction)htmlButton:(id)sender {
    NSString * html = @"<h1>Esto es html</h1><p style='color:red;'>Esto es el mensaje<p>";
    [_navegador loadHTMLString:html baseURL:nil];
}

- (IBAction)jsButton:(id)sender {
    NSString * script = @"alert('Hola desde JS');";
    [_navegador stringByEvaluatingJavaScriptFromString:script];
}

- (IBAction)webButton:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:@"http://multimedialab.co"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    
    [_navegador loadRequest:request];
}
- (IBAction)pdfButton:(id)sender {
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"libro" ofType:@"pdf"];
    NSData * datos = [[NSData alloc] initWithContentsOfFile:ruta];
    
    
    [_navegador loadData:datos MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_cargando startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_cargando stopAnimating];
}
@end
