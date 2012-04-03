//
//  FirstViewController.h
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 PUC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, retain) NSArray *options;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end
