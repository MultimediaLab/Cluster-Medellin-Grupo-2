//
//  ViewController.m
//  Galeria
//
//  Created by Profesor on 12/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray * pageImages;
@property NSMutableArray * pageViews;

@end

@implementation ViewController

//Metodos Propios
-(void)loadPage:(NSInteger)page{
    if (page<0 || page >= _pageImages.count) {
        return;
    }
    //Cargar Pagina
    UIView * pageView = [_pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        //El view no existe
        CGRect frame= _scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        
        UIImageView * newPageView = [[UIImageView alloc] initWithImage:[_pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [_scrollView addSubview:newPageView];
        [_pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
}
-(void)deletePage:(NSInteger)page{
    if (page<0 || page >= _pageImages.count) {
        return;
    }
    UIView * pageView = [_pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [_pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}
-(void)loadVisiblePages{
    CGFloat pageWidth = _scrollView.frame.size.width;
    NSInteger page = floor((_scrollView.contentOffset.x*2.0f+ pageWidth)/(pageWidth * 2.0f));
    
    //Paginas que se van a cargar
    NSInteger firstPage = page -1;
    NSInteger lastPage = page + 1;
    
    //Borrrando las paginas que estan antes del first Page
    for (NSInteger i = 0; i<firstPage; i++) {
        [self deletePage:i];
    }
    //Cargo la pagina que esta en el rango
    for (NSInteger i = firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    //Borro las paginas que estan despues del Last Page
    for (NSInteger i = lastPage+1; i<_pageImages.count; i++) {
        [self deletePage:i];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _pageImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"photo1.png"], [UIImage imageNamed:@"photo2.png"],[UIImage imageNamed:@"photo3.png"],[UIImage imageNamed:@"photo4.png"],[UIImage imageNamed:@"photo5.png"], nil];
    _pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<_pageImages.count; i++) {
        [_pageViews addObject:[NSNull null]];
    }
    CGSize pageScrollViewSize = _scrollView.frame.size;
    _scrollView.contentSize = CGSizeMake(pageScrollViewSize.width*_pageImages.count, pageScrollViewSize.height);
    [self loadVisiblePages];
}
//Metodo del protocolo
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self loadVisiblePages];
}











//Metodos del UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
