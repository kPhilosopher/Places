
//  TabBarController.m
//  Places
//
//  Created by Jinwoo Baek on 11/7/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController()
-(void) setup;
-(void) allocInitTheNavigationViewControllers;
-(void) allocInitTheCustomTableViewControllers;
-(void) pushViewControllersToNavigationViewControllers;
-(void) setupTheDataSourceForTheTableViewControllersToShareTheFlickrDataSource;
-(void) setTabBarItemToSystemItems;
-(void) releaseViewControllersThatArePushedIntoTheViewControllerHierarchy;

@property (retain) UINavigationController *topRatedNavigationViewController;
@property (retain) UINavigationController *favoritesNavigationViewController;	
@property (retain) TopRatedTableViewController *topRatedTableViewController;
@property (retain) FavoritesTableViewController *favoritesTableViewController;
@end

@implementation TabBarController
@synthesize topRatedNavigationViewController, favoritesNavigationViewController, topRatedTableViewController, favoritesTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
	[self setup];
    return self;
}
	-(void) setup
	{
		[self allocInitTheNavigationViewControllers];
		[self allocInitTheCustomTableViewControllers];
		[self setTabBarItemToSystemItems];
		self.viewControllers = [NSArray arrayWithObjects: self.topRatedNavigationViewController, 
														  self.favoritesNavigationViewController, nil];
		[self releaseViewControllersThatArePushedIntoTheViewControllerHierarchy];
		
		UINavigationController *navController;
		if([[self.viewControllers objectAtIndex:0] isKindOfClass:[UINavigationController class]])
		{
			navController = [self.viewControllers objectAtIndex:0];
			NSLog(@"got to the nav controller");
			if([navController.topViewController isKindOfClass:[FavoritesTableViewController class]])
			{
				NSLog(@"got to the top rated table view controller");
			}
		}
	}
		-(void) allocInitTheNavigationViewControllers
		{
			self.topRatedNavigationViewController = [[UINavigationController alloc] init];
			self.favoritesNavigationViewController = [[UINavigationController alloc] init];
		}
		-(void) allocInitTheCustomTableViewControllers
		{
			self.topRatedTableViewController = [[TopRatedTableViewController alloc] initWithStyle:UITableViewStylePlain];
			self.favoritesTableViewController = [[FavoritesTableViewController alloc] initWithStyle:UITableViewStylePlain];
			[self setupTheDataSourceForTheTableViewControllersToShareTheFlickrDataSource];
			[self pushViewControllersToNavigationViewControllers];
		}
			-(void) setupTheDataSourceForTheTableViewControllersToShareTheFlickrDataSource
			{
				self.topRatedTableViewController.flickrDataSource = [[FlickrDataSource alloc] init];
				self.favoritesTableViewController.flickrDataSource = self.topRatedTableViewController.flickrDataSource;
			}
			-(void) pushViewControllersToNavigationViewControllers
			{
				[self.topRatedNavigationViewController pushViewController:self.topRatedTableViewController animated:YES];
				[self.favoritesNavigationViewController pushViewController:self.favoritesTableViewController animated:YES];
			}
		-(void) setTabBarItemToSystemItems
		{
			self.topRatedNavigationViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
//			self.topRatedNavigationViewController.tabBarItem.accessibilityLabel = @"topRatedTabBarItem";
			self.favoritesNavigationViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:2];
//			self.favoritesNavigationViewController.tabBarItem.accessibilityLabel = @"favoritesTabBarItem";
		}
		-(void) releaseViewControllersThatArePushedIntoTheViewControllerHierarchy
		{
			[self.topRatedNavigationViewController release];
			[self.favoritesNavigationViewController release];
			[self.favoritesTableViewController release];
			[self.topRatedTableViewController release];
		}

-(BOOL) notifyRecentlyViewedPlaceWith:(int) index from:(id) sender
{
	return NO;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeRight
			|| interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void) dealloc
{
	[super dealloc];
}

#pragma mark -
#pragma mark Private API


@end
