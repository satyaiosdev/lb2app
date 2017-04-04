//
//  Annotation.h
//  MapRoute
//
//  Created by yqlabs1 on 08/02/13.
//  Copyright (c) 2013 yqlabs1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKAnnotation.h>
@interface Annotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSMutableString *title;
}
@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)NSMutableString *title;

@end
