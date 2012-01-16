//
//  AppDelegateTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "AppDelegateTests.h"

#define TITLE_OF_SCROLLABLEVIEWCONTROLLER @"Photo"

@implementation AppDelegateTests
@synthesize appDelegate = _appDelegate;

- (void)setUp
{
    [super setUp];
	self.appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
}

- (void)tearDown
{
	self.appDelegate = nil;
    [super tearDown];
}

- (void)testScrollableImageViewController
{
	STAssertNotNil(self.appDelegate.scrollableImageVC, @"The scrollable image view controller is not allocated and initated.");
	STAssertTrue([self.appDelegate.scrollableImageVC isKindOfClass:[ScrollableImageViewController class]], @"The variable scrollableImageVC didn't retain a ScrollableImageViewController class object");
	STAssertTrue([self.appDelegate.scrollableImageVC.title isEqualToString:TITLE_OF_SCROLLABLEVIEWCONTROLLER], @"The title of the scrollabeImagVC is not set correctly");
}

- (void)testTabBarControllerAllocInit
{
	STAssertNotNil(self.appDelegate.tabBarController, @"the tab bar controller is not allocated and inititated.");
}

- (void)testiPadConfiguration
{
	if([[UIScreen mainScreen] bounds].size.height > 500)
	{
		STAssertNotNil(self.appDelegate.splitVC,@"For the iPad configuration, the split view controller is not allocated and inititated.");
		STAssertTrue([self.appDelegate.scrollableImageVC isEqual:self.appDelegate.splitVC.delegate],@"For the iPad configuration, the delegate of the split view controller is not set to the scrollabe Image View Controller");
		
		STAssertTrue([[self.appDelegate.splitVC.viewControllers objectAtIndex:0] isKindOfClass:[TabBarController class]], @"For the iPad configuration, the master view controller of the split view controller is not a Tab Bar Controller");
		STAssertTrue([[self.appDelegate.splitVC.viewControllers objectAtIndex:1] isKindOfClass:[UINavigationController class]], @"For the iPad configuration, the slave view controller of the split view controller is not a Navigation Controller");
		UINavigationController *navcon = (UINavigationController*)[self.appDelegate.splitVC.viewControllers objectAtIndex:1];
		TabBarController *tabcon = (TabBarController*)[self.appDelegate.splitVC.viewControllers objectAtIndex:0];
		STAssertTrue([tabcon isEqual:self.appDelegate.tabBarController],@"For the iPad configuration, the tab bar controller extracted from the split view controller is not the same tab bar controller as given from the app delegate");
		STAssertTrue([navcon.topViewController isKindOfClass:[ScrollableImageViewController class]],@"For the iPad configuration, the top view controller of the navigation controller, which is the slave view controller of the split view controller, is not a Scrollable View Controller.");
		ScrollableImageViewController *scrollableVC = (ScrollableImageViewController*)navcon.topViewController;
		STAssertTrue([self.appDelegate.scrollableImageVC isEqual:scrollableVC],@"For the iPad configuration, the scrollabe image view controller extracted from the split view controller is not same scrollable image view controller as given from the app delegate.");
		STAssertTrue([[self.appDelegate.window.subviews objectAtIndex:0] isEqual:self.appDelegate.splitVC.view],@"For the iPad configuration, the subview given to the app delegate does not match the view of the split view controller");
	}
}

- (void)testiPhoneOriPodConfiguration
{
	if([[UIScreen mainScreen] bounds].size.height < 500)
	{
		STAssertTrue([[self.appDelegate.window.subviews objectAtIndex:0] isEqual:self.appDelegate.tabBarController.view],@"For the iPhone or iPod configuration, the subview given to the app delegate does not match the view of the tab bar controller.");
	}
}

@end
