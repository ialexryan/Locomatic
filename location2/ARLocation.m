//
//  ARLocation.m
//  location
//
//  Created by Alex Ryan on 7/15/14.
//  Copyright (c) 2014 alexryan. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ARLocation.h"

@implementation ARLocation

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//  NSLog(@"Received an update");
  CLLocation* latestLocation = [locations lastObject];
  NSDate* eventDate = latestLocation.timestamp;
  NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//  if (abs(howRecent) < 15.0) {
    // If the event is recent, do something with it.
//    NSLog(@"latitude %+.6f, longitude %+.6f, accuracy %+.2f\n",
//          latestLocation.coordinate.latitude,
//          latestLocation.coordinate.longitude,
//          latestLocation.horizontalAccuracy);
//  }
}

- (void)startStandardUpdates
{
  NSLog(@"Starting location monitoring");
  if (nil == _locationManager) {
    _locationManager = [[CLLocationManager alloc] init];
  }
  CLAuthorizationStatus d = [CLLocationManager authorizationStatus];
  NSLog(@"Location services is %d", d);
  _locationManager.delegate = self;
  _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  
  _locationManager.distanceFilter = 0.1;
  
  [_locationManager startUpdatingLocation];
}

- (void)stopStandardUpdates
{
  NSLog(@"Stopping location monitoring");
  [_locationManager stopUpdatingLocation];
}

- (CLLocation *)location
{
  return [_locationManager location];
}

@end
