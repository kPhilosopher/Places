//
//  KIFTestScenario+PlacesAdditions.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/16/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "KIFTestScenario+PlacesAdditions.h"
#import "KIFTestStep.h"
#import "KIFTestStep+PlacesAdditions.h"

@implementation KIFTestScenario (PlacesAdditions)

+ (id)scenarioToPressTheTopPlacesTabBarItem;
{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a user can successfully tap into Places Table View Controller from Top Places View Controller."];	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:0.2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Top Rated"]];
    
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:0.2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];

	return scenario;
}

+ (id)scenarioToPressTheMostRecentPlacesTabBarItem;
{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a user can successfully tap into Places Table View Controller from Top Places View Controller."];	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:0.2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Most Recent"]];
    
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:0.2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	return scenario;
}


+ (id)scenarioToViewTopPlacesTableView;
{
	KIFTestScenario *preliminaryScenario = [KIFTestScenario scenarioToPressTheTopPlacesTabBarItem];
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a user can successfully tap into Places Table View Controller from Top Places View Controller."];
	[scenario addStepsFromArray:preliminaryScenario.steps];
	NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
	[scenario addStep:[KIFTestStep stepToTapRowInTableViewWithAccessibilityLabel:@"topPlacesTableView" atIndexPath:path]];
	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	return scenario;
}

+ (id)scenarioToViewMostRecentPlacesTableView;
{
	KIFTestScenario *preliminaryScenario = [KIFTestScenario scenarioToPressTheMostRecentPlacesTabBarItem];
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a user can successfully tap into Places Table View Controller from Most Recent Places View Controller."];	
	[scenario addStepsFromArray:preliminaryScenario.steps];
	NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
	[scenario addStep:[KIFTestStep stepToTapRowInTableViewWithAccessibilityLabel:@"mostRecentTableView" atIndexPath:path]];
	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	return scenario;
}

+ (id)scenarioToViewTheFirstPictureOfThePlace;
{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a user can successfully view a picture from the PictureListTableViewController."];	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:0.2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
	[scenario addStep:[KIFTestStep stepToTapRowInTableViewWithAccessibilityLabel:@"pictureListTableView" atIndexPath:path]];
	
    [scenario addStep:[KIFTestStep stepToWaitForTimeInterval:2 description:@"An arbitrary wait just to demonstrate adding an additional step"]];
	return scenario;
}

@end

