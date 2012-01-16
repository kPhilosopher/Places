//
//  TabBarController_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//
#import "PLTabBarController.h"

@interface PLTabBarController()
{
@private
	UINavigationController *PL_topPlacesNavigationViewController;
	UINavigationController *PL_favoritesNavigationViewController;
	TopPlacesTableViewController *PL_topPlacesTableViewController;
	MostRecentTableViewController *PL_mostRecentTableViewController;
	id <PictureListTableViewControllerDelegate> PL_delegateToTransfer;
}

#pragma mark - Private method

- (void)PL_setup;

#pragma mark - Readability method

- (void)RD_allocInitTheNavigationViewControllers;
- (void)RD_setupTheCustomTableViewControllers;
- (void)RD_pushViewControllersToNavigationViewControllers;
- (void)RD_setTabBarItemToSystemItems;
- (void)RD_releaseViewControllersThatArePushedIntoTheViewControllerHierarchy;
- (void)RD_setDelegateToTransferForTableViewControllersForiPad;
- (void)RD_allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource;
- (void)RD_addTheNavigationControllersToThisTabBarController;

@end