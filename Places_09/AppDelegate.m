//
//  AppDelegate.m
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "AppDelegate-Internal.h"
#import "SplitViewController.h"
#if RUN_KIF_TESTS
#import "PlacesKIFTestController.h"
#endif

#define TITLE_OF_SCROLLABLEVIEWCONTROLLER @"Photo"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tab_Bar_Controller = _tab_Bar_Controller;
@synthesize scrollableImageVC = _scrollableImageVC;
@synthesize splitVC = _splitVC;

#pragma mark -
#pragma mark didFinishLaunchingWithOptions Sequence

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
	[self setupTheAppDelegateWindow];
	[self initializeTabBarController];
	[self setupForScrollableImageViewController];
	[self determineTheSetupSequenceForDifferingDevices];
	[self.window makeKeyAndVisible];
	[self runKIFIfRunningIntegrationTest];
    return YES;
}
	- (void)setupTheAppDelegateWindow;
	{
		self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
		self.window.backgroundColor = [UIColor whiteColor];
	}
	- (void)initializeTabBarController;
	{
		self.tab_Bar_Controller = [[[TabBarController alloc] initWithDelegate:self] autorelease];
	}
	- (void)setupForScrollableImageViewController;
	{
		self.scrollableImageVC = [[[ScrollableImageViewController alloc] init] autorelease];
		self.scrollableImageVC.title = TITLE_OF_SCROLLABLEVIEWCONTROLLER;
	}
	- (void)determineTheSetupSequenceForDifferingDevices;
	{
		if ([self determineIfTheDeviceIsiPadOrNot])		[self setupForiPad];
		else											[self setupForiPhoneOriPod];
	}
		- (BOOL)determineIfTheDeviceIsiPadOrNot;
		{
			return ([[UIScreen mainScreen] bounds].size.height > 500);
		}
		- (void)setupForiPad;
		{
			UINavigationController *navcon = [[UINavigationController alloc] init];
			[self setupSplitViewController:navcon];
			[navcon pushViewController:self.scrollableImageVC animated:NO];
			self.window.rootViewController = self.splitVC;
			[navcon release];
		}
			- (void)setupSplitViewController:(UINavigationController*)navcon;
			{
				self.splitVC = [[[SplitViewController alloc] init] autorelease];
				self.splitVC.delegate = self.scrollableImageVC;
				self.splitVC.viewControllers = 
				[NSArray arrayWithObjects:self.tab_Bar_Controller, navcon, nil];
			}
		- (void)setupForiPhoneOriPod;
		{
			self.window.rootViewController = self.tab_Bar_Controller;
		}
	- (void)runKIFIfRunningIntegrationTest;
	{
		#if RUN_KIF_TESTS
			[[PlacesKIFTestController sharedInstance] startTestingWithCompletionBlock:^{
				// Exit after the tests complete so that CI knows we're done
				exit([[PlacesKIFTestController sharedInstance] failureCount]);
			}];
		#endif
	}

#pragma mark -
#pragma mark View lifecycle
- (void)dealloc;
{
	[_tab_Bar_Controller release];
	[_scrollableImageVC release];
	[_splitVC release];
	[_window release];
    [super dealloc];
}

#pragma mark -
#pragma mark PictureListTableViewController Delegate Protocol Method

-(ScrollableImageViewController *)getScrollableImageViewControllerForRequestor:(PictureListTableViewController *)controller;
{
	return self.scrollableImageVC;
}

@end
