//
//  DisplayMap.h
//  Pacha
//
//  Created by Fabio Mendonça on 13/07/11.
//  Copyright 2011 Vogall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "LocalizacaoViewController.h"
#import <MapKit/MapKit.h>

@interface DisplayMap : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;
    UIImage *image;
	NSString *title;
	NSString *subtitle;
    
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) UIImage *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
