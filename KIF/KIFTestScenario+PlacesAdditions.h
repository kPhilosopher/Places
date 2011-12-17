//
//  KIFTestScenario+PlacesAdditions.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/16/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIFTestScenario.h"

@interface KIFTestScenario (PlacesAdditions)

+ (id)scenarioToPressTheTopPlacesTabBarItem;
+ (id)scenarioToPressTheMostRecentPlacesTabBarItem;
+ (id)scenarioToViewTopPlacesTableView;
+ (id)scenarioToViewMostRecentPlacesTableView;
+ (id)scenarioToViewTheFirstPictureOfThePlace;

@end
