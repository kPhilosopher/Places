
//  TabBarController.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/7/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#include "TabBarController_Hidden.h"

@interface TabBarController()

@property (retain) UINavigationController *topPlacesNavigationViewController;
@property (retain) UINavigationController *favoritesNavigationViewController;	
@property (retain) TopPlacesTableViewController *topPlacesTableViewController;
@property (retain) MostRecentTableViewController *mostRecentTableViewController;

@end

@implementation TabBarController
@synthesize topPlacesNavigationViewController = _topPlacesNavigationViewController;
@synthesize favoritesNavigationViewController = _favoritesNavigationViewController;
@synthesize topPlacesTableViewController = _topPlacesTableViewController;
@synthesize mostRecentTableViewController = _mostRecentTableViewController;
@synthesize delegateToTransfer = _delegateToTransfer;

#pragma mark -
#pragma mark Initalization
- (id) initWithDelegate:(id) delegate
{
	self.delegateToTransfer = delegate;
	return [self init];
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
	[self setup];
    return self;
}
#pragma mark Setup Methods
	-(void) setup;
	{
		[self allocInitTheNavigationViewControllers];
		[self setupTheCustomTableViewControllers];
		[self setTabBarItemToSystemItems];
		[self addTheNavigationControllersToThisTabBarController];
		[self releaseViewControllersThatArePushedIntoTheViewControllerHierarchy];
	}
		-(void) allocInitTheNavigationViewControllers;
		{
			self.topPlacesNavigationViewController = [[[UINavigationController alloc] init] autorelease];
			self.favoritesNavigationViewController = [[[UINavigationController alloc] init] autorelease];
		}
		-(void) setupTheCustomTableViewControllers;
		{
			[self allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource];
			[self setDelegateToTransferForTableViewControllers];
			[self pushViewControllersToNavigationViewControllers];
		}
			- (void)allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource;
			{
				FlickrDataSource *theFlickrDataSource = [[FlickrDataSource alloc] init];
				self.topPlacesTableViewController = 
				[[[TopPlacesTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:theFlickrDataSource] autorelease];
				self.mostRecentTableViewController = 
				[[[MostRecentTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:theFlickrDataSource] autorelease];
				[theFlickrDataSource release];
			}
			- (void)setDelegateToTransferForTableViewControllers;
			{
				self.topPlacesTableViewController.delegateToTransfer = self.delegateToTransfer;
				self.mostRecentTableViewController.delegateToTransfer = self.delegateToTransfer;
			}
			-(void) pushViewControllersToNavigationViewControllers;
			{
				[self.topPlacesNavigationViewController pushViewController:self.topPlacesTableViewController animated:YES];
				[self.favoritesNavigationViewController pushViewController:self.mostRecentTableViewController animated:YES];
			}
		-(void) setTabBarItemToSystemItems;
		{
			self.topPlacesNavigationViewController.tabBarItem = 
			[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
			self.favoritesNavigationViewController.tabBarItem = 
			[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:2];
		}
		- (void)addTheNavigationControllersToThisTabBarController;
		{
			self.viewControllers = [NSArray arrayWithObjects: self.topPlacesNavigationViewController, 
									self.favoritesNavigationViewController, nil];
		}
		-(void) releaseViewControllersThatArePushedIntoTheViewControllerHierarchy;
		{
			[self.topPlacesNavigationViewController release];
			[self.favoritesNavigationViewController release];
			[self.mostRecentTableViewController release];
			[self.topPlacesTableViewController release];
		}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void) dealloc
{
	[_topPlacesTableViewController release];
	[_mostRecentTableViewController release];
	[_topPlacesNavigationViewController release];
	[_favoritesNavigationViewController release];
	[super dealloc];
}
@end
