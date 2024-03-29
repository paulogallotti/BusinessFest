//
//  FirstViewController.h
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray *options;

@property (nonatomic, retain) UILabel *countdownLabel;

- (IBAction)infoAction:(id)sender;

@end
