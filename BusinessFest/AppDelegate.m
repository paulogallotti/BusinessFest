//
//  AppDelegate.m
//  BusinessFest
//
//  Created by Fabio Mendonça on 02/04/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

@synthesize window = _window, mMoviePlayer;
@synthesize navigationController = _navigationController;

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [mMoviePlayer release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    MainViewController *viewController = [[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    self.window.rootViewController = self.navigationController;
    
    NSURL* mMovieURL;
    NSBundle *bundle = [NSBundle mainBundle];
    if(bundle != nil)
    {
        NSString *moviePath = [bundle pathForResource:@"businessfest_iphone_intro" ofType:@"m4v"];
        if (moviePath)
        {
            mMovieURL = [NSURL fileURLWithPath:moviePath];
            [mMovieURL retain];
        }
    }
    mMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:mMovieURL];
    [mMovieURL release];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(moviePlayBackDidFinish:) 
                                                 name:MPMoviePlayerPlaybackDidFinishNotification 
                                               object:mMoviePlayer];
    
    mMoviePlayer.controlStyle = MPMovieControlStyleNone;
    //mMoviePlayer.scalingMode = MPMovieScalingModeFill;
    //[self.window addSubview:mMoviePlayer.view];
    //[self.navigationController.view addSubview:mMoviePlayer.view];
    //[self.navigationController.view bringSubviewToFront:mMoviePlayer.view];
    //[mMoviePlayer setFullscreen:YES animated:NO];
    
    [mMoviePlayer.view setFrame:CGRectMake(0, 0, 320, 480)];
    [self.window.rootViewController.view addSubview:mMoviePlayer.view];
    
    [mMoviePlayer play];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) moviePlayBackDidFinish:(NSNotification*)notification
{
    NSLog(@"Intro video stopped");
    [mMoviePlayer release];
    [self.mMoviePlayer.view removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
