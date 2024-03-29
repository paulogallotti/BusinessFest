//
//  AppDelegate.h
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MPMoviePlayerController *mMoviePlayer;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
