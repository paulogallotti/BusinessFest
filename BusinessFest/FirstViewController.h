//
//  FirstViewController.h
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 PUC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTableViewController;

@interface FirstViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) MyTableViewController *viewController;

@end
