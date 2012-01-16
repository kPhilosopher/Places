//
//  AppDelegate.m
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//

#import "AppDelegate-Internal.h"
#import "SplitViewController.h"
#if RUN_KIF_TESTS
#import "PlacesKIFTestController.h"
#endif

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = PL_tabBarController;
@synthesize scrollableImageVC = PL_scrollableImageVC;
@synthesize splitVC = PL_splitVC;

NSString *PLTitleOfScrollableViewController = @"Photo";

#pragma mark - View lifecycle

- (void)dealloc;
{
	[PL_tabBarController release];
	[PL_scrollableImageVC release];
	[PL_splitVC release];
	[_window release];
    [super dealloc];
}

#pragma mark - didFinishLaunchingWithOptions sequence

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
	[self RD_setupTheAppDelegateWindow];
	[self RD_initializeTabBarController];
	[self RD_determineTheSetupSequenceForDifferingDevices];
	[self.window makeKeyAndVisible];
	[self RD_runKIFIfRunningIntegrationTest];
    return YES;
}
	- (void)RD_setupTheAppDelegateWindow;
	{
		self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
		self.window.backgroundColor = [UIColor whiteColor];
	}
	- (void)RD_initializeTabBarController;
	{
		self.tabBarController = [[[TabBarController alloc] initWithDelegate:self] autorelease];
	}
	- (void)RD_determineTheSetupSequenceForDifferingDevices;
	{
		if ([self RD_determineIfTheDeviceIsiPadOrNot])	
			[self RD_setupForiPad];
		else
			[self RD_setupForiPhoneOriPod];
	}
		- (BOOL)RD_determineIfTheDeviceIsiPadOrNot;
		{
			return ([[UIScreen mainScreen] bounds].size.height > 500);
		}
		- (void)RD_setupForiPad;
		{
			[self RD_setupForScrollableImageViewController];
			UINavigationController *navcon = [[UINavigationController alloc] init];
			[navcon pushViewController:self.scrollableImageVC animated:NO];
			[self RD_setupSplitViewControllerWithNavigationController:navcon];
			self.window.rootViewController = self.splitVC;
			[navcon release];
		}
			- (void)RD_setupForScrollableImageViewController;
			{
				self.scrollableImageVC = [[[ScrollableImageViewController alloc] init] autorelease];
				self.scrollableImageVC.title = PLTitleOfScrollableViewController;
			}
			- (void)RD_setupSplitViewControllerWithNavigationController:(UINavigationController *)navcon;
			{
				self.splitVC = [[[SplitViewController alloc] init] autorelease];
				self.splitVC.delegate = self.scrollableImageVC;
				self.splitVC.viewControllers = 
				[NSArray arrayWithObjects:self.tabBarController, navcon, nil];
			}
		- (void)RD_setupForiPhoneOriPod;
		{
			self.window.rootViewController = self.tabBarController;
		}
	- (void)RD_runKIFIfRunningIntegrationTest;
	{
		#if RUN_KIF_TESTS
			[[PlacesKIFTestController sharedInstance] startTestingWithCompletionBlock:^{
				// Exit after the tests complete so that CI knows we're done
				exit([[PlacesKIFTestController sharedInstance] failureCount]);
			}];
		#endif
	}

#pragma mark - PictureListTableViewController Delegate Protocol Method

-(ScrollableImageViewController *)scrollableImageViewControllerForRequestor:(PictureListTableViewController *)controller;
{
	return self.scrollableImageVC;
}

@end
