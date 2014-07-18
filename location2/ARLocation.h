//
//  ARLocation.h
//  location
//
//  Created by Alex Ryan on 7/15/14.
//  Copyright (c) 2014 alexryan. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@interface ARLocation : NSObject <CLLocationManagerDelegate>

@property CLLocationManager *locationManager;

- (void)startStandardUpdates;
- (void)stopStandardUpdates;
- (CLLocation *)location;

@end
