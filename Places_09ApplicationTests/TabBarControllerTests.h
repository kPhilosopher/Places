//
//  TabBarControllerTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "AppDelegate.h"

@interface TabBarControllerTests : SenTestCase
{
@private
	AppDelegate *_appDelegate;
	UINavigationController *_rightNavigationViewController;
	UINavigationController *_leftNavigationViewController;
	TopPlacesTableViewController *_topPlacesTableViewController;
	MostRecentTableViewController *_mostRecentTableViewController;
}

@property (retain) AppDelegate *appDelegate;
@property (retain) UINavigationController *leftNavigationViewController;
@property (retain) UINavigationController *rightNavigationViewController;
@property (retain) TopPlacesTableViewController *topPlacesTableViewController;
@property (retain) MostRecentTableViewController *mostRecentTableViewController;

@end
