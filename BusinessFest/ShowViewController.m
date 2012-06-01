//
//  ShowViewController.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 PUC. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)openViewAction:(id)sender
{
    //http://www.youtube.com/watch?feature=player_embedded&v=bnb4yvxH-qc
    //http://www.youtube.com/watch?feature=player_embedded&v=iqZbddKtEgc
    
    switch ([sender tag])
    {
        case 0:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?feature=player_embedded&v=bnb4yvxH-qc"]];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?feature=player_embedded&v=iqZbddKtEgc"]];
    }
}

@end
