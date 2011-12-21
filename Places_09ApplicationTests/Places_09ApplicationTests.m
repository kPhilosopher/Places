//
//  Places_09ApplicationTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/17/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "Places_09ApplicationTests.h"

@implementation Places_09ApplicationTests
@synthesize appDelegate, leftNavigationViewController, rightNavigationViewController, topRatedTableViewController, mostRecentTableViewController;

- (void)setUp
{
    [super setUp];
	//use this for the tab bar controller tests
	self.appDelegate = [[UIApplication sharedApplication] delegate];
	if ([[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0] isKindOfClass:[UINavigationController class]] &&
		[[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1] isKindOfClass:[UINavigationController class]])
	{
		self.leftNavigationViewController = (UINavigationController *)[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0];
		self.rightNavigationViewController = (UINavigationController *)[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1];
	}
	
	if ([self.leftNavigationViewController.topViewController isMemberOfClass:[TopRatedTableViewController class]] &&
		[self.rightNavigationViewController.topViewController isMemberOfClass:[MostRecentTableViewController class]])
	{
		self.topRatedTableViewController = (TopRatedTableViewController *)self.leftNavigationViewController.topViewController;
		self.mostRecentTableViewController = (MostRecentTableViewController *)self.rightNavigationViewController.topViewController;
	}	
}

- (void)tearDown
{
    [super tearDown];
}


- (void) testAppDelegate {
	STAssertNotNil(self.appDelegate, @"Cannot find the application delegate");
}

- (void)testUITabBarControllerExistance
{
	STAssertTrue((self.appDelegate.window.subviews !=nil),@"The subview array of the window of the appDelegate is empty");
	if (self.appDelegate.window.subviews == nil) 
	{
		STAssertTrue((self.appDelegate.tab_Bar_Controller.view != nil), @"The view of the TabBarController that is a subview of the appDelegate window is not shown on the screen");
	}
}

-(void) testTabBarControllerSubControllers
{
	STAssertTrue(([self.appDelegate.tab_Bar_Controller.viewControllers count] == 2),@"The tab bar controller's tab bar item is not 2");
	if ([self.appDelegate.tab_Bar_Controller.viewControllers count] == 2) 
	{
		STAssertTrue([[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0] isKindOfClass:[UINavigationController class]],@"The first tab bar item is not a navigation view controller");
		STAssertTrue([[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1] isKindOfClass:[UINavigationController class]],@"The second tab bar item is not a navigation view controller");
	}
}

-(void) testTopRatedAndMostRecentTableViewControllers
{	
	STAssertTrue(([[[self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0] view] window] != nil),@"the navigation controller with the top places does not show up.");
	STAssertTrue([self.leftNavigationViewController.topViewController isKindOfClass:[UITableViewController class]], @"The top view controller in the navigation controller of the Top Places tab is not a UITableViewController");
	STAssertTrue([self.leftNavigationViewController.topViewController isKindOfClass:[TopRatedTableViewController class]], @"The top view controller in the navigation controller of the Top Places tab is not a TopRatedTableViewController");
	STAssertTrue([self.leftNavigationViewController.topViewController.title isEqualToString:@"Top Places"], @"The top table view controller's title is not 'Top Rated'");
	
	STAssertTrue([self.rightNavigationViewController.topViewController isKindOfClass:[UITableViewController class]], @"The top view controller in the navigation controller of the Favorites tab is not a UITableViewController");
	STAssertTrue([self.rightNavigationViewController.topViewController isKindOfClass:[MostRecentTableViewController class]], @"The top view controller in the navigation controller of the Favorites tab is not a MostRecentTableViewController");
	STAssertTrue([self.rightNavigationViewController.topViewController.title isEqualToString:@"Most Recent"], @"The top table view controller's title is not 'Most Recent'");
}

//-(void) testTabBarButtonSettings
//{
////	UINavigationController *navigationViewControllerOfTopPlaces = (UINavigationController *) [self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:0];
////	STAssertTrue([navigationViewControllerOfTopPlaces.tabBarItem.title isEqualToString:@"Top Rated"], @"The Tab Bar Item of Top Places doesn't have a title of 'Top Rated'.");
//	
////	UINavigationController *navigationViewControllerOfFavorites = (UINavigationController *) [self.appDelegate.tab_Bar_Controller.viewControllers objectAtIndex:1];
////	STAssertTrue([navigationViewControllerOfTopPlaces.tabBarItem.title isEqualToString:@"Favorites"], @"The Tab Bar Item of Top Places doesn't have a title of 'Favorites'.");
//}

-(void) testTheOrientationOfTheTableViewControllers
{
	
	STAssertTrue([self.appDelegate.tab_Bar_Controller shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait],@"TopRated TableViewController does not supports Portrait Orientation");
	STAssertTrue([self.appDelegate.tab_Bar_Controller shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft],@"TopRated TableViewController does not supports Landscape Orientation to the Left");
	STAssertTrue([self.appDelegate.tab_Bar_Controller shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight],@"TopRated TableViewController does not supports Landsacape Orientation to the Right");
	STAssertFalse([self.appDelegate.tab_Bar_Controller shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown],@"TopRated TableViewController should not support upside-down Oritentation");
	
	STAssertTrue([self.leftNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait],@"TopRated TableViewController does not supports Portrait Orientation");
//	STAssertTrue([self.leftNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft],@"TopRated TableViewController does not supports Landscape Orientation to the Left");
//	STAssertTrue([self.leftNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight],@"TopRated TableViewController does not supports Landsacape Orientation to the Right");
	STAssertFalse([self.leftNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown],@"TopRated TableViewController should not support upside-down Oritentation");
	
	STAssertTrue([self.rightNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait],@"Favorites TableViewController does not supports Portrait Orientation");
//	STAssertTrue([self.rightNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft],@"Favorites TableViewController does not supports Landscape Orientation to the Left");
//	STAssertTrue([self.rightNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight],@"Favorites TableViewController does not supports Landsacape Orientation to the Right");
	STAssertFalse([self.rightNavigationViewController.topViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown],@"Favorites TableViewController should not support upside-down Oritentation");
}

-(void) testIfTheTopRatedAndMostRecentTableViewControllersHaveSameModel
{
	if(self.topRatedTableViewController.flickrDataSource && self.mostRecentTableViewController.flickrDataSource)
	{
		STAssertTrue([self.topRatedTableViewController.flickrDataSource isEqual:self.mostRecentTableViewController.flickrDataSource],@"The model is not shared between the TopRated and Favorites Table View Controllers");
	}
	else
	{
		STFail(@"The top rated and favorites table view controllers' model is not initialized when they are initialized");
	}
}

-(void) testTheDownloadedDataThroughFlickrDataSource
{
    STAssertFalse((self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray == nil),@"The Flickr Top Places Data is not loaded");
	if (!(self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray == nil))
	{
		STAssertTrue([self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray isKindOfClass:[NSArray class]],@"The Flickr Top Places Data is not an array");
		STAssertTrue(([self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray count] >= 1),@"The Flickr Top Places Data is empty");
		if([self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray  isKindOfClass:[NSArray class]] && 
		   ([self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray  count] >= 1))
		{
			NSDictionary *temporaryDictionary = [self.topRatedTableViewController.flickrDataSource.flickrTopPlacesArray  objectAtIndex:0];
			STAssertTrue([[temporaryDictionary objectForKey:@"_content"] isKindOfClass:[NSString class]],@"The first dictionary from the flickr top places array does not have a valid object for the key of '_content'.");
		}
	}
}














@end