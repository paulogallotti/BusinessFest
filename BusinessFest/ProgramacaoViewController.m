//
//  ProgramacaoViewController.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "ProgramacaoViewController.h"
#import "ProgramacaoCell.h"
#import "ProgramacaoDetailViewController.h"
#import "CerimonialViewController.h"
#import "ShowViewController.h"

@interface ProgramacaoViewController ()

@property (nonatomic, retain) NSArray *options;

@end

@implementation ProgramacaoViewController

@synthesize options;

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
    [options release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *e1 = [NSDictionary dictionaryWithObjectsAndKeys:@"16:00h às 19:00h", @"time", @"Mostra Empresarial e Rodadas de Negócios", @"description", nil];
    NSDictionary *e2 = [NSDictionary dictionaryWithObjectsAndKeys:@"19:30h às 20:30h", @"time", @"Premiações, Homenagens, Menções Patrocinadores e Vídeos Institucionais", @"description", nil];
    NSDictionary *e3 = [NSDictionary dictionaryWithObjectsAndKeys:@"20:30h às 22:30h", @"time", @"Grande Show de Encerramento com o grupo Toque de Arte", @"description", nil];
    
    self.options = [[NSArray alloc] initWithObjects:e1, e2, e3, nil];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.options count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124.0;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ProgramacaoCell";
    ProgramacaoCell *cell = (ProgramacaoCell *)[_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil];
        for (id currentObject in nib)
        {
            if ([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (ProgramacaoCell *) currentObject;
                break;
            }
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.timeLabel.text = [[self.options objectAtIndex:[indexPath row]] objectForKey:@"time"];
    cell.eventLabel.text = [[self.options objectAtIndex:[indexPath row]] objectForKey:@"description"];
    
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            ProgramacaoDetailViewController *viewController = [[ProgramacaoDetailViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
        }
        case 1:
        {
            CerimonialViewController *viewController = [[CerimonialViewController alloc] init];
            viewController.title = @"Cerimonial";
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
            break;
        }
        case 2:
        {
            ShowViewController *viewController = [[ShowViewController alloc] init];
            viewController.title = @"Show";
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
            break;
        }
    }
    
}

@end
