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
//	[self setMapLocation:-80.1936589 :25.7742658];
	
	MapPin *ann = [[MapPin alloc] init];
	ann.coordinate = location;
	[self.mapViewOutlet addAnnotation:ann];
	
	locationManager.delegate = self;
	self.mapViewOutlet.delegate = self;
	locationManager = [[CLLocationManager alloc] init];
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
	[locationManager requestWhenInUseAuthorization];
	[locationManager requestAlwaysAuthorization];
	[locationManager startUpdatingLocation];
	
	self.mapViewOutlet.showsUserLocation = TRUE;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
	// make map zoom into to certain location
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	
	CLLocationCoordinate2D location;
	
	location.latitude = userLocation.coordinate.latitude;
	location.longitude = userLocation.coordinate.longitude;
	
	region.span = span;
	region.center = location;
	
	[self.mapViewOutlet setRegion:region animated:TRUE];
}

- (IBAction)directionsTo:(id)sender {
	CLLocationCoordinate2D location;
	
	location.latitude = 25.7742658;
	location.longitude = -80.1936589;
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", location.latitude, location.longitude]] options:@{} completionHandler:NULL];
}

//- (void)setMapLocation:(double)longitude :(double)latitude {
//	MKCoordinateRegion region;
//	MKCoordinateSpan span;
//
//	span.latitudeDelta = 0.005;
//	span.longitudeDelta = 0.005;
//
//	CLLocationCoordinate2D location;
//
//	location.latitude = latitude;
//	location.longitude = longitude;
//
//	region.span = span;
//	region.center = location;
//
//	[self.mapViewOutlet setRegion:region animated:TRUE];
//}
@end
