//
//  ViewController.m
//  MapViewApp
//
//  Created by Gabriel Betancourt on 9/1/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// set startup location
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	
	CLLocationCoordinate2D location;
	
	location.latitude = 25.7742658;
	location.longitude = -80.1936589;
	
	region.span = span;
	region.center = location;
	
	[self.mapViewOutlet setRegion:region animated:TRUE];
}


- (IBAction)setStandardMap:(id)sender {
	self.mapViewOutlet.mapType = MKMapTypeStandard;
}

- (IBAction)setSatelliteMap:(id)sender {
	self.mapViewOutlet.mapType = MKMapTypeSatellite;
}

- (IBAction)setHybridMap:(id)sender {
	self.mapViewOutlet.mapType = MKMapTypeHybrid;
}

- (IBAction)locateOnMap:(id)sender {
	
}

- (IBAction)directionsTo:(id)sender {
	
}

@end
