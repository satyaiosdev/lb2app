//
//  ViewController.h
//  lb2app
//
//  Created by Mallikarjuna on 27/03/17.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate,NSURLConnectionDataDelegate,MKMapViewDelegate>

@property(nonatomic,retain) IBOutlet MKMapView *mapViewObject;

@end

