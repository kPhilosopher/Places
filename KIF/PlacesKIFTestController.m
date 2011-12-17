//
//  PlacesKIFTestController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/16/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PlacesKIFTestController.h"
#import "KIFTestScenario+PlacesAdditions.h"

@implementation PlacesKIFTestController


- (void)initializeScenarios;
{
    [self addScenario:[KIFTestScenario scenarioToViewTopPlacesTableView]];
	[self addScenario:[KIFTestScenario scenarioToViewMostRecentPlacesTableView]];
	[self addScenario:[KIFTestScenario scenarioToPressTheTopPlacesTabBarItem]];
	[self addScenario:[KIFTestScenario scenarioToViewTheFirstPictureOfThePlace]];
	[self addScenario:[KIFTestScenario scenarioToPressTheMostRecentPlacesTabBarItem]];
	[self addScenario:[KIFTestScenario scenarioToViewTheFirstPictureOfThePlace]];
}

@end