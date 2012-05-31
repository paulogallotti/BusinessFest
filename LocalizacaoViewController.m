//
//  LocalizacaoViewController.m
//  BusinessFest
//
//  Created by Fabio Mendonça on 03/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "LocalizacaoViewController.h"
#import "DisplayMap.h"

@implementation LocalizacaoViewController

@synthesize mapview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [mapview setMapType:MKMapTypeStandard];
    [mapview setZoomEnabled:YES];
    [mapview setScrollEnabled:YES];
    
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
    region.center.latitude = -22.982851;
    region.center.longitude = -43.365446;
    region.span.latitudeDelta = 0.04f;
    region.span.longitudeDelta = 0.04f;
    
    [mapview setRegion:region animated:YES];
    
    [mapview setDelegate:self];
    
    DisplayMap *ann = [[DisplayMap alloc] init]; 
    ann.title = @"Citibank Hall - Barra da Tijuca";
    ann.subtitle = @"Av. Ayrton Senna - 3.000 , RJ"; 
    ann.coordinate = region.center; 
    [mapview addAnnotation:ann];
    
    [ann release];

}

- (void)viewDidUnload
{
    self.mapview = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)setMap:(id)sender
{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

-(IBAction)getlocation
{
    //SE O CÓDIGO ABAIXO NÃO FUNCIONA NO IPHONE DEVICE, USAR SHOWUSERLOCATION
    mapview.showsUserLocation = YES;
    
    if ([CLLocationManager locationServicesEnabled]) 
    {
        CLLocationManager* manager = [[CLLocationManager alloc] init];
        [manager startUpdatingLocation]; 
        [manager release];
    }
    else
    {
        UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:@"Ooops" message:@"Serviços de localização não habilitados. Vá para as configurações do iPhone para habilitá-las." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerta show];
        [alerta release];
    }
}

-(IBAction)mostraCoordenadas
{
	CLLocationCoordinate2D coordenada = CLLocationCoordinate2DMake(-22.982851, -43.365446);
	MKCoordinateSpan span = MKCoordinateSpanMake(0.04f,0.04f);
	MKCoordinateRegion region = MKCoordinateRegionMake(coordenada, span);
	[mapview setRegion:region];
}




-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation: (CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake (newLocation.coordinate, span);
    [mapview setRegion:region animated:YES];
    [manager stopUpdatingLocation];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:
(NSError *)error 
{
    if ([error code] == kCLErrorDenied){ UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:@"Ooops"                                                                                          message:@"Você recusou este aplicativo de acessar a sua localização" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerta show];
        [alerta release];
    } if ([error code] == kCLErrorLocationUnknown){
        UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:@"Ooops" message:@"Não consegui determinar a sua localização." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerta show];
        [alerta release];
    }
}


- (void)dealloc
{
    [mapview release];
    [super dealloc];
}

@end
