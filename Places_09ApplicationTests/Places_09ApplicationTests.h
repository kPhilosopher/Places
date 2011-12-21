//
//  Places_09ApplicationTests.m
//  PlacesApplicationTests
//
//  Created by Jinwoo Baek on 10/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "AppDelegate.h"

@interface Places_09ApplicationTests : SenTestCase
{
@private
	AppDelegate *appDelegate;
	UINavigationController *rightNavigationViewController;
	UINavigationController *leftNavigationViewController;
	TopRatedTableViewController *topRatedTableViewController;
	MostRecentTableViewController *mostRecentTableViewController;
}

@property (retain) AppDelegate *appDelegate;
@property (retain) UINavigationController *leftNavigationViewController;
@property (retain) UINavigationController *rightNavigationViewController;
@property (retain) TopRatedTableViewController *topRatedTableViewController;
@property (retain) MostRecentTableViewController *mostRecentTableViewController;

- (void) testAppDelegate;
@end

