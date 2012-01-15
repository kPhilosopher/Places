//
//  PLFlickrDataSource.h
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrDataHandler.h"

@interface PLFlickrDataSource : NSObject
{
	@private
	NSArray *_flickrTopPlacesArray;
    NSMutableArray *_flickrMostRecentPlacesArray;
	NSMutableArray *_theElementSectionsForTopPlaces;
	NSMutableArray *_theElementSectionsForMostRecentPlaces;
	NSMutableSet *_flickrMostRecentPlacesSet;
	FlickrDataHandler *_flickrDataHandler;
	NSString *_alertViewSwitch;
	NSString *_alertSwitchOn;
	NSString *_alertSwitchOff;
}

extern NSString *alertSwitchOff;
extern NSString *alertSwitchOn;

@property (nonatomic ,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic ,retain) NSMutableArray *flickrMostRecentPlacesArray;
@property (nonatomic ,retain) NSMutableArray *theElementSectionsForTopPlaces;
@property (nonatomic ,retain) NSMutableArray *theElementSectionsForMostRecentPlaces;
@property (assign) NSString *alertViewSwitch;
@property (nonatomic ,assign) NSString *alertSwitchOn;
@property (nonatomic ,assign) NSString *alertSwitchOff;

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
- (NSArray *)getPhotoListForSpecificFlickrPlaceID:(NSString *)flickrPlaceId;
- (void)addToTheMostRecentListOfPlacesTheFollowingDictionary:(NSDictionary *)dictionaryToAddToMostRecentList;
- (void)deleteFromMostRecentListThePlaceWithTheFollowing:(NSDictionary *)dictionaryToDelete;
//TODO: add tests for these methods.
- (void)setupForTopPlacesArrayFromFlickr;
- (void)setupThePropertyForMostRecentPlaces;

@end
