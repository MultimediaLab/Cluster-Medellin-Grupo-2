//
//  Model.m
//  iCalendar
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Model.h"
#import "CalendarioViewController.h"

@interface Model()
@property (readonly,strong, nonatomic) NSArray * pageData;
@end
@implementation Model

-(id)init{
    self = [super init];
    if (self) {
       //Condigo del constructor
        NSDateFormatter * dateF = [[NSDateFormatter alloc] init];
        _pageData = [[dateF monthSymbols] copy];
        //NSLog(@"%@", _pageData);
        //_pageData = [NSArray arrayWithObjects:@"Enero",@"Febrero", nil];
    }
    return self;

}
//Metodos Propios de Model
-(CalendarioViewController*) viewControllerAtIndex: (NSInteger)index storyboard: (UIStoryboard*)storyboard{
    
    if (index >= [_pageData count]) {
        return nil;
    }
    CalendarioViewController * calendar = [storyboard instantiateViewControllerWithIdentifier:@"CalendarioViewController"];
    calendar.dataObject = [_pageData objectAtIndex:index];
    return calendar;
    
}
-(NSUInteger)indexOfViewController: (CalendarioViewController*)viewController{
    return [_pageData indexOfObject:viewController.dataObject];
}

//Metodos del Protocolo UIPageViewControllerDataSource


//Metodo cuando el paginador va hacia adelante
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (index == [_pageData count]-1) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];

}

//Metodo cuando el paginador va hacia atras
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (index == 0) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];

}
@end
