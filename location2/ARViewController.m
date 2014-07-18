//
//  ARViewController.m
//  location2
//
//  Created by Alex Ryan on 7/16/14.
//  Copyright (c) 2014 alexryan. All rights reserved.
//

#import "ARLocation.h"
#import "ARViewController.h"

@interface ARViewController ()


@property (weak, nonatomic) IBOutlet UIButton *getLocationButton;
@property (weak, nonatomic) IBOutlet UISwitch *locationTrackingSwitch;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;


@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  _locationManager = [[ARLocation alloc] init];
  [_getLocationButton setEnabled:NO];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getLocation:(id)sender {
  if (!(_locationTrackingSwitch.on)) {
    [_getLocationButton setEnabled:NO];
    return;
  }
  
  CLLocation *latestLocation = [_locationManager location];
  NSLog(@"latitude %+.6f, longitude %+.6f, accuracy %+.2f\n",
        latestLocation.coordinate.latitude,
        latestLocation.coordinate.longitude,
        latestLocation.horizontalAccuracy);
  NSString *print = [NSString stringWithFormat:@"Latitude: %+.6f\nLongitude: %+.6f\nAccuracy: %u m",
                     latestLocation.coordinate.latitude,
                     latestLocation.coordinate.longitude,
                     (unsigned int)latestLocation.horizontalAccuracy];
  _locationLabel.text = print;
}

- (IBAction)locationTrackingSwitchToggled:(id)sender {
  if (_locationTrackingSwitch.on){
    [_locationManager startStandardUpdates];
    [_getLocationButton setEnabled:YES];
  }
  if (!_locationTrackingSwitch.on){
    [_getLocationButton setEnabled:NO];
    _locationLabel.text = @"";
    [_locationManager stopStandardUpdates];
  }
}


@end
