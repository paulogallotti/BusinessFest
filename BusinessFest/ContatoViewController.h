//
//  ContatoViewController.h
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"

@interface ContatoViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)siteAction:(id)sender;

- (IBAction)emailAction:(id)sender;

@end
