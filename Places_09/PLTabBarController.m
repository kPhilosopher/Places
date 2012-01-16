//
//  PLTabBarController.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/7/11.
//

#include "PLTabBarController-Internal.h"

@interface PLTabBarController()

@property (retain) UINavigationController *topPlacesNavigationViewController;
@property (retain) UINavigationController *favoritesNavigationViewController;	
@property (retain) TopPlacesTableViewController *topPlacesTableViewController;
@property (retain) MostRecentTableViewController *mostRecentTableViewController;

@end

@implementation PLTabBarController
@synthesize topPlacesNavigationViewController = PL_topPlacesNavigationViewController;
@synthesize favoritesNavigationViewController = PL_favoritesNavigationViewController;
@synthesize topPlacesTableViewController = PL_topPlacesTableViewController;
@synthesize mostRecentTableViewController = PL_mostRecentTableViewController;
@synthesize delegateToTransfer = PL_delegateToTransfer;

NSString *PLTabBarViewAccessibilityLabel = @"Tab bar";

#pragma mark - Initalization

- (id)initWithDelegate:(id)delegate
{
	self.delegateToTransfer = delegate;
	return [self init];
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self PL_setup];
		self.view.accessibilityLabel = PLTabBarViewAccessibilityLabel;
    }
    return self;
}

#pragma mark - View lifecycle

-(void)dealloc
{
	[PL_topPlacesTableViewController release];
	[PL_mostRecentTableViewController release];
	[PL_topPlacesNavigationViewController release];
	[PL_favoritesNavigationViewController release];
	[super dealloc];
}

#pragma mark Setup sequence

-(void)PL_setup;
{
	[self RD_allocInitTheNavigationViewControllers];
	[self RD_setupTheCustomTableViewControllers];
	[self RD_setTabBarItemToSystemItems];
	[self RD_addTheNavigationControllersToThisTabBarController];
	[self RD_releaseViewControllersThatArePushedIntoTheViewControllerHierarchy];
}
	-(void)RD_allocInitTheNavigationViewControllers;
	{
		self.topPlacesNavigationViewController = [[[UINavigationController alloc] init] autorelease];
		self.favoritesNavigationViewController = [[[UINavigationController alloc] init] autorelease];
	}
	-(void)RD_setupTheCustomTableViewControllers;
	{
		[self RD_allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource];
		self.topPlacesTableViewController.delegateToUpdateMostRecentPlaces = self.mostRecentTableViewController;
		[self RD_setDelegateToTransferForTableViewControllersForiPad];
		[self RD_pushViewControllersToNavigationViewControllers];
	}
		- (void)RD_allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource;
		{
			FlickrDataHandler *flickrDataHandler = [[FlickrDataHandler alloc] init];
			PlacesDataIndexer *placesDataIndexerForTopPlaces = [[PlacesDataIndexer alloc] init];
			PlacesDataIndexer *placesDataIndexerForMostRecentPlaces = [[PlacesDataIndexer alloc] init];
			PLFlickrDataSource *theFlickrDataSource = [[PLFlickrDataSource alloc] initWithFlickrDataHandler:flickrDataHandler];
			
			self.topPlacesTableViewController = 
			[[[TopPlacesTableViewController alloc] initWithStyle:UITableViewStylePlain withTheFlickrDataSource:theFlickrDataSource withTheDataIndexer:placesDataIndexerForTopPlaces] autorelease];
			self.mostRecentTableViewController = 
			[[[MostRecentTableViewController alloc] initWithStyle:UITableViewStylePlain withTheFlickrDataSource:theFlickrDataSource withTheDataIndexer:placesDataIndexerForMostRecentPlaces] autorelease];
			
			[theFlickrDataSource release];
			[placesDataIndexerForMostRecentPlaces release];
			[placesDataIndexerForTopPlaces release];
		}
		- (void)RD_setDelegateToTransferForTableViewControllersForiPad;
		{
			self.topPlacesTableViewController.delegateToTransfer = self.delegateToTransfer;
			self.mostRecentTableViewController.delegateToTransfer = self.delegateToTransfer;
		}
		-(void)RD_pushViewControllersToNavigationViewControllers;
		{
			[self.topPlacesNavigationViewController pushViewController:self.topPlacesTableViewController animated:YES];
			[self.favoritesNavigationViewController pushViewController:self.mostRecentTableViewController animated:YES];
		}
	-(void)RD_setTabBarItemToSystemItems;
	{
		self.topPlacesNavigationViewController.tabBarItem = 
		[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
		self.favoritesNavigationViewController.tabBarItem = 
		[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:2];
	}
	- (void)RD_addTheNavigationControllersToThisTabBarController;
	{
		self.viewControllers =
		[NSArray arrayWithObjects: self.topPlacesNavigationViewController, self.favoritesNavigationViewController, nil];
	}
	-(void)RD_releaseViewControllersThatArePushedIntoTheViewControllerHierarchy;
	{
		[self.topPlacesNavigationViewController release];
		[self.favoritesNavigationViewController release];
		[self.mostRecentTableViewController release];
		[self.topPlacesTableViewController release];
	}

@end