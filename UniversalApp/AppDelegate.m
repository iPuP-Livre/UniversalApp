//
//  AppDelegate.m
//  UniversalApp
//
//  Created by Marian Paul on 03/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "DetailViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize splitViewController = _splitViewController;
@synthesize phoneNavigationController = _phoneNavigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) 
    {
        self.splitViewController = [[UISplitViewController alloc] init];
        self.window.rootViewController = self.splitViewController;
        
        RootViewController *root = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
        UINavigationController *navRoot = [[UINavigationController alloc] initWithRootViewController:root];
        
        DetailViewController *detail = [[DetailViewController alloc] init];
        UINavigationController *navDetail = [[UINavigationController alloc] initWithRootViewController:detail];

        self.splitViewController.delegate = detail;
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:navRoot, navDetail, nil];
    }
    else
    {
        RootViewController *root = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
        self.phoneNavigationController = [[UINavigationController alloc] initWithRootViewController:root];
        self.window.rootViewController = self.phoneNavigationController;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
