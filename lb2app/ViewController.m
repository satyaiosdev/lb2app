//
//  ViewController.m
//  lb2app
//
//  Created by Mallikarjuna on 27/03/17.
//
//

#import "ViewController.h"
#import "Annotation.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapViewObject;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    mapViewObject.delegate=self;
    MKCoordinateRegion region = [mapViewObject regionThatFits:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(48.210033, 16.363449), 200, 200)];
    [mapViewObject setRegion:region animated:YES];
    
    Annotation *ann = [[Annotation alloc]init];
    float latValue=48.210033;
    float lngValue=16.363449;
    ann.coordinate = CLLocationCoordinate2DMake(latValue,lngValue);
    //  ann.title = [NSString stringWithFormat:@"%@",fromText.text];
    [mapViewObject addAnnotation:ann];
    
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"CITYBIKEOGD" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    NSDictionary *dataList = (NSDictionary *)[NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL];
    
    
    NSArray *features_Array=[dataList valueForKey:@"features"];
    
    for (int i=0; i<=features_Array.count-1; i++) {
        NSLog(@"Lat: %@",[[[[features_Array objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:0]);
        NSLog(@"Lon: %@",[[[[features_Array objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:1]);

        Annotation *ann = [[Annotation alloc]init];
        float latValue=[[[[[features_Array objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:1] floatValue];
        float lngValue=[[[[[features_Array objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:0] floatValue];
        ann.coordinate = CLLocationCoordinate2DMake(latValue,lngValue);
        ann.title=[NSMutableString stringWithFormat:@"%@",[[[features_Array objectAtIndex:0] objectForKey:@"properties"] objectForKey:@"STATION"]];
        [mapViewObject addAnnotation:ann];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *SFAnnotationIdentifier = @"SFAnnotationIdentifier";
    MKPinAnnotationView *pinView =
    (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
    if (!pinView)
    {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:SFAnnotationIdentifier];
        UIImage *flagImage = [UIImage imageNamed:@"Citybike.png"];
        annotationView.image = flagImage;
        return annotationView;
    }
    else
    {
        pinView.annotation = annotation;
    }
    return pinView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
    
    
    
}


@end
