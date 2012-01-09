//
//  TabBarController.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/7/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopPlacesTableViewController.h"
#import "MostRecentTableViewController.h"

@interface TabBarController : UITabBarController
{
	@private
	UINavigationController *_topPlacesNavigationViewController;
	UINavigationController *_favoritesNavigationViewController;
	TopPlacesTableViewController *_topPlacesTableViewController;
	MostRecentTableViewController *_mostRecentTableViewController;
	id <PictureListTableViewControllerDelegate> _delegateToTransfer;
}

@property (retain) id <PictureListTableViewControllerDelegate> delegateToTransfer;
- (id)initWithDelegate:(id)delegate;

@end