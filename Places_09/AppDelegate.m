//
//  AppDelegate.m
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "AppDelegate.h"
#if RUN_KIF_TESTS
#import "PlacesKIFTestController.h"
#endif
@implementation AppDelegate

@synthesize window = _window;
@synthesize tab_Bar_Controller;
@synthesize scrollableImageVC;

- (void)dealloc
{
	[tab_Bar_Controller release];
	[scrollableImageVC release];
	[_window release];
    [super dealloc];
}


-(ScrollableImageViewController *)retrieveScrollableImageViewControllerFor:(PictureListTableViewController *)controller
{
	return self.scrollableImageVC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	self.scrollableImageVC = [[ScrollableImageViewController alloc] init];
	self.scrollableImageVC.title = @"Photo";
	self.tab_Bar_Controller = [[TabBarController alloc] initWithDelegate:self];
	if ([[UIScreen mainScreen] bounds].size.height > 500) 
	{
		UINavigationController *nav = [[UINavigationController alloc] init];
		UISplitViewController *splitVC = [[UISplitViewController alloc] init];
		splitVC.delegate = self.scrollableImageVC;
		[nav pushViewController:self.scrollableImageVC animated:NO];
		splitVC.viewControllers = [NSArray arrayWithObjects:self.tab_Bar_Controller, nav, nil];
		[nav release];
		[self.window addSubview:splitVC.view];
	}
	else
	{
		[self.window addSubview:self.tab_Bar_Controller.view];
    }
	self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	#if RUN_KIF_TESTS
		[[PlacesKIFTestController sharedInstance] startTestingWithCompletionBlock:^{
			// Exit after the tests complete so that CI knows we're done
			exit([[PlacesKIFTestController sharedInstance] failureCount]);
		}];
	#endif
    return YES;
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

@end
