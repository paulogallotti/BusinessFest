//
//  CerimonialViewController.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "CerimonialViewController.h"
#import "CerimonialViewCell.h"

@interface CerimonialViewController ()

@end

@implementation CerimonialViewController

@synthesize scrollView;

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
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 700.0);
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"Cerimonial" owner:self options:nil] objectAtIndex:0];
    [self.scrollView addSubview:view];
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

@end
