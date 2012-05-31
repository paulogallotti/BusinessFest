//
//  FirstViewController.m
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "MainViewController.h"
#import "EventoViewController.h"
#import "ProgramacaoViewController.h"
#import "LocalizacaoViewController.h"
#import "EntidadesEmpresasViewController.h"
#import "ContatoViewController.h"

@implementation FirstViewController

@synthesize options, tableView, countdownLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *banner = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 286.0, 70.0)];
    banner.backgroundColor = [UIColor orangeColor];
    //banner.image = [UIImage imageNamed:@"business_fest_banner"];
    self.navigationItem.titleView = banner;
    
    self.options = [[NSArray alloc] 
                    initWithObjects:@"O Evento", @"Programação", @"Localização", @"Entidades e Empresas", @"Contato", nil];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    
    countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 10.0, 320.0, 20.0)];
    self.countdownLabel.font = [UIFont fontWithName:@"Helvetica Neue BoldMT" size:16.0];
    self.countdownLabel.textColor = [UIColor whiteColor];
    self.countdownLabel.textAlignment = UITextAlignmentCenter;
    self.countdownLabel.backgroundColor = [UIColor clearColor];
    self.countdownLabel.numberOfLines = 2;
    [self.navigationController.toolbar addSubview:self.countdownLabel];
    [self.countdownLabel release];
}

-(void)dealloc
{
    [options release];
    [tableView release];
    [countdownLabel release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *eventDate = [f dateFromString:@"2012-06-26"];
    [f release];
    NSDate *today = [NSDate date];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:today
                                                          toDate:eventDate
                                                         options:0];
    [gregorianCalendar release];
    
    if (components.day == 1) {
        self.countdownLabel.text = [NSString stringWithFormat:@"Falta %i dia para o Business Fest", components.day];
    } else if (components.day > 0) {
        self.countdownLabel.text = [NSString stringWithFormat:@"Faltam %i dias para o Business Fest", components.day];
    } else if (components.day == 0) {
        self.countdownLabel.text = @"O Business Fest é hoje!";
    } else {
        self.countdownLabel.text = @"O que você achou do evento?";
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.options count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    cell.textLabel.text = [self.options objectAtIndex: [indexPath row]];
    
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch ([indexPath row]) {
        case 0:
        {
            EventoViewController *eventoViewController = [[EventoViewController alloc] init];
            eventoViewController.title = @"O Evento";
            [self.navigationController pushViewController:eventoViewController animated:YES];
            [eventoViewController release];
            break;
        }
        case 1:
        {
            ProgramacaoViewController *viewController = [[ProgramacaoViewController alloc] init];
            viewController.title = @"Programação";
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
        }
        case 2:
        {
            LocalizacaoViewController *localizacaoViewController = [[LocalizacaoViewController alloc] init];
            localizacaoViewController.title = @"Localização";
            [self.navigationController pushViewController:localizacaoViewController animated:YES];
            [localizacaoViewController release];
            break;
        }
        case 3:
        {
            EntidadesEmpresasViewController *viewController = [[EntidadesEmpresasViewController alloc] init];
            viewController.title = @"Entidades e Empresas";
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
        }
        case 4:
        {
            ContatoViewController *viewController = [[ContatoViewController alloc] init];
            viewController.title = @"Contato";
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            break;
        }
    }
}

@end
