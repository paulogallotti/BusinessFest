//
//  LocalizacaoViewController.h
//  BusinessFest
//
//  Created by Fabio Mendonça on 03/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class DisplayMap;

@interface LocalizacaoViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
{
    DisplayMap* currentpino;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapview;

-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;
-(IBAction)mostraCoordenadas;

@end
