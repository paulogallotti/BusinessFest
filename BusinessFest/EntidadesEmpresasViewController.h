//
//  EntidadesEmpresasViewController.h
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntidadesEmpresasViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) UIView *entidadesView;
@property (nonatomic, retain) UIView *empresasView;

- (IBAction)optionSelected:(id)sender;

@end
