//
//  TabBarController.h
//  Places
//
//  Created by Jinwoo Baek on 11/7/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopRatedTableViewController.h"
#import "MostRecentTableViewController.h"

@interface TabBarController : UITabBarController
{
	@private
	UINavigationController *topRatedNavigationViewController;
	UINavigationController *favoritesNavigationViewController;
	TopRatedTableViewController *topRatedTableViewController;
	MostRecentTableViewController *mostRecentTableViewController;
}
@end
