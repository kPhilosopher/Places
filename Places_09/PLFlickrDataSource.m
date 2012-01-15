//
//  PLFlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PLFlickrDataSource.h"
#import "PLFlickrDataSource-Internal.h"

@implementation PLFlickrDataSource
@synthesize flickrTopPlacesArray = _flickrTopPlacesArray;
@synthesize flickrMostRecentPlacesArray = _flickrMostRecentPlacesArray;
@synthesize flickrMostRecentPlacesSet = _flickrMostRecentPlacesSet;
@synthesize theElementSectionsForTopPlaces = _theElementSectionsForTopPlaces;
@synthesize theElementSectionsForMostRecentPlaces = _theElementSectionsForMostRecentPlaces;
@synthesize flickrDataHandler = _flickrDataHandler;
@synthesize alertViewSwitch = _alertViewSwitch;
@synthesize alertSwitchOn = _alertSwitchOn;
@synthesize alertSwitchOff = _alertSwitchOff;

const int PLMaximumOfMostRecentPlacesList = 10;

NSString *keyForMostRecentArray = @"mostRecentArrayKey";
NSString *keyForMostRecentSet = @"mostRecentSetKey";
NSString *alertSwitchOff = @"AlertOff";
NSString *alertSwitchOn = @"AlertOn";

#pragma mark - Initialization sequence
- (id)init
{
	return [self initWithFlickrDataHandler:[[[FlickrDataHandler alloc] init] autorelease]];
}

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
{
	[super init];
	self.flickrDataHandler = flickrDataHandler;
	self.alertViewSwitch = alertSwitchOff;
	return self;
}

- (void)setupForTopPlacesArrayFromFlickr;
{
	id temporaryFlickrTopPlaces = [self.flickrDataHandler getTopPlacesFromFlickr];
	if ([temporaryFlickrTopPlaces isKindOfClass:[NSArray class]])
	{
		self.flickrTopPlacesArray = (NSArray *)temporaryFlickrTopPlaces;
	}
	else
	{
		self.flickrTopPlacesArray = [NSArray array];
		self.alertViewSwitch = alertSwitchOn;
	}
}

- (void)setupThePropertyForMostRecentPlaces;
{
	self.flickrMostRecentPlacesArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:keyForMostRecentArray]];
	self.flickrMostRecentPlacesSet = [NSMutableSet setWithSet:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:keyForMostRecentSet]]];
}

#pragma mark - FlickrFunctions

- (NSArray *)getPhotoListForSpecificFlickrPlaceID:(NSString *)flickrPlaceID
{
	NSArray *arrayOfPhotos = nil;
	id temporaryPhotoList = [self.flickrDataHandler getPhotoListsAtPlace:flickrPlaceID];
	if ([temporaryPhotoList isKindOfClass:[NSArray class]])
		arrayOfPhotos = (NSArray *) temporaryPhotoList;
	else
	{
		arrayOfPhotos = [NSArray array];
		self.alertViewSwitch = alertSwitchOn;
	}
	return arrayOfPhotos;
}

- (void)addToTheMostRecentListOfPlacesTheFollowingDictionary:(NSDictionary *)dictionary;
{
	id elementOfPlaceId = [dictionary objectForKey:@"place_id"];
	NSString *placeID;
	if ([elementOfPlaceId isKindOfClass:[NSString class]])
	{
		placeID = (NSString *)elementOfPlaceId;
		//handle the set
		if ([self.flickrMostRecentPlacesSet containsObject:placeID])
		{
			int indexToRemove = [self P_returnIndexOfFlickrMostRecentPlacesArrayThatContainsPlaceIDString:placeID];
			if (indexToRemove != -1)
				[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
		}
		else	[self.flickrMostRecentPlacesSet addObject:placeID];
		
		//handle the array
		[self.flickrMostRecentPlacesArray insertObject:dictionary atIndex:0];
		
		if ([self.flickrMostRecentPlacesArray count] > PLMaximumOfMostRecentPlacesList) 
			[self.flickrMostRecentPlacesArray removeLastObject];
		//add to persistence.
		[self P_updateMostRecentDataToStandardUserDefaults];
	}
}

- (void)deleteFromMostRecentListThePlaceWithTheFollowing:(NSDictionary *)dictionaryToDelete;
{
	//redo this parts
	[self.flickrMostRecentPlacesSet removeObject:[dictionaryToDelete valueForKey:@"place_id"]];
	[self.flickrMostRecentPlacesArray removeObjectAtIndex:[self P_returnIndexOfFlickrMostRecentPlacesArrayThatContainsPlaceIDString:[dictionaryToDelete valueForKey:@"place_id"]]];
	[self P_updateMostRecentDataToStandardUserDefaults];
}

- (int)P_returnIndexOfFlickrMostRecentPlacesArrayThatContainsPlaceIDString:(NSString *)placeID;
{
	int indexToRemove = -1;
	for (int counter = 0; self.flickrMostRecentPlacesArray.count > counter ; counter++) 
	{
		if ([[self.flickrMostRecentPlacesArray objectAtIndex:counter] isKindOfClass:[NSDictionary class]])
		{
			NSDictionary *dictionary = [self.flickrMostRecentPlacesArray objectAtIndex:counter];
			if ([[dictionary objectForKey:@"place_id"] isEqual:placeID])
			{
				indexToRemove = counter;
				counter = self.flickrMostRecentPlacesArray.count;
			}
		}
	}
	return indexToRemove;
}

- (void)P_updateMostRecentDataToStandardUserDefaults;
{
	[[NSUserDefaults standardUserDefaults] setObject:self.flickrMostRecentPlacesArray forKey:keyForMostRecentArray];
	[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.flickrMostRecentPlacesSet] forKey:keyForMostRecentSet];
	[[NSUserDefaults standardUserDefaults] synchronize];
}



#pragma mark - Property

- (NSMutableArray *)flickrMostRecentPlacesArray
{
	if (!_flickrMostRecentPlacesArray)
		_flickrMostRecentPlacesArray = [[NSMutableArray alloc] init];
	return _flickrMostRecentPlacesArray;
}

- (NSMutableSet *)flickrMostRecentPlacesSet
{
	if (!_flickrMostRecentPlacesSet)
		_flickrMostRecentPlacesSet = [[NSMutableSet alloc] init];
	return _flickrMostRecentPlacesSet;
}

- (NSString *)alertSwitchOff
{
	return alertSwitchOff;
}

- (NSString *)alertSwitchOn
{
	return alertSwitchOn;
}

#pragma mark - Dealloc
- (void)dealloc
{
	[_flickrMostRecentPlacesArray release];
	[_flickrMostRecentPlacesSet release];
	[_flickrTopPlacesArray release];
	[super dealloc];
}

@end