//
//  ViewController.h
//  MapViewApp
//
//  Created by Gabriel Betancourt on 9/1/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapViewOutlet;

- (IBAction)setStandardMap:(id)sender;
- (IBAction)setSatelliteMap:(id)sender;
- (IBAction)setHybridMap:(id)sender;
- (IBAction)locateOnMap:(id)sender;
- (IBAction)directionsTo:(id)sender;
@end

