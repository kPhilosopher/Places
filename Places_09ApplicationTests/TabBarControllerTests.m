//
//  TabBarControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TabBarControllerTests.h"

@implementation TabBarControllerTests
@synthesize appDelegate = _appDelegate;
@synthesize rightNavigationViewController = _rightNavigationViewController;
@synthesize leftNavigationViewController = _leftNavigationViewController;
@synthesize topPlacesTableViewController = _topPlacesTableViewController;
@synthesize mostRecentTableViewController = _mostRecentTableViewController;

- (void)setUp
{
    [super setUp];
	self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	if ([[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0] isKindOfClass:[UINavigationController class]] &&
		[[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1] isKindOfClass:[UINavigationController class]])
	{
		self.leftNavigationViewController = 
		(UINavigationController *)[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0];
		self.rightNavigationViewController = 
		(UINavigationController *)[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1];
	}
	
	if ([self.leftNavigationViewController.topViewController isKindOfClass:[TopPlacesTableViewController class]] &&
		[self.rightNavigationViewController.topViewController isKindOfClass:[MostRecentTableViewController class]])
	{
		self.topPlacesTableViewController = (TopPlacesTableViewController *)self.leftNavigationViewController.topViewController;
		self.mostRecentTableViewController = (MostRecentTableViewController *)self.rightNavigationViewController.topViewController;
	}
}

- (void)tearDown
{
	self.appDelegate = nil;
	self.leftNavigationViewController = nil;
	self.rightNavigationViewController = nil;
	self.topPlacesTableViewController = nil;
	self.mostRecentTableViewController = nil;
    [super tearDown];
}

- (void)testExistanceOfNavigationControllers
{
	STAssertNotNil(self.leftNavigationViewController,@"The left navigation view controller is not set, which means the top places  navigation controller is not set in the tab bar controller.");
	STAssertNotNil(self.rightNavigationViewController,@"The right navigation view controller is not set, which means the most recent places navigation controller is not set in the tab bar controller.");
}

- (void)testExistenceOfPlaceTableViewControllers
{
	
	STAssertNotNil(self.topPlacesTableViewController, @"The top places table view controller is not set, which mean the top places table view controller is not set in the tab bar controller.");
	STAssertNotNil(self.mostRecentTableViewController, @"The top places table view controller is not set, which mean the most recent places table view controller is not set in the tab bar controller.");
}

- (void)testTabBarItems
{
	STAssertTrue((self.leftNavigationViewController.tabBarItem.tag = 1) ,@"The left tab bar item is not set correctly.");
	STAssertTrue((self.rightNavigationViewController.tabBarItem.tag = 2), @"The right tab bar item is not set correctly.");
}

- (void)testDelegateToTransfer
{
	[self.appDelegate isEqual:self.topPlacesTableViewController.delegateToTransfer];
	[self.appDelegate isEqual:self.mostRecentTableViewController.delegateToTransfer];
}

- (void)testTheCommonFlickrDataSourceGivenToThePlacesTableViewControllers
{
	STAssertNotNil(self.topPlacesTableViewController.flickrDataSource,@"The flickrDataSource for the top places table view controller is not set");
	STAssertNotNil(self.mostRecentTableViewController.flickrDataSource,@"The flickrDataSource for the top places table view controller is not set");
	[self.topPlacesTableViewController.flickrDataSource isEqual:self.mostRecentTableViewController.flickrDataSource];
}



@end
