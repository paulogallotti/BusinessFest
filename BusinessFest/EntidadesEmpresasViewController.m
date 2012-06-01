//
//  EntidadesEmpresasViewController.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "EntidadesEmpresasViewController.h"

@interface EntidadesEmpresasViewController ()

@end

@implementation EntidadesEmpresasViewController

@synthesize scrollView, entidadesView, empresasView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [scrollView release];
    [entidadesView release];
    [empresasView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 900.0);
    self.entidadesView = [[[NSBundle mainBundle] loadNibNamed:@"Entidades" owner:self options:nil] objectAtIndex:0];
    self.empresasView = [[[NSBundle mainBundle] loadNibNamed:@"Empresas" owner:self options:nil] objectAtIndex:0];
    [self.scrollView addSubview:entidadesView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)optionSelected:(id)sender
{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    if (seg.selectedSegmentIndex == 0)
    {
        // Entidades
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 900.0);
        [self.empresasView removeFromSuperview];
        [self.scrollView addSubview:entidadesView];
    }
    else
    {
        // Empresas
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1070.0);
        [self.entidadesView removeFromSuperview];
        [self.scrollView addSubview:empresasView];
    }
}

@end
