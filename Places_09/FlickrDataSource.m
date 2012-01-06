//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource.h"
#import "FlickrDataSource-Internal.h"

#define MAX_MOST_RECENT_LIST 10

@implementation FlickrDataSource
@synthesize flickrTopPlacesArray = _flickrTopPlacesArray;
@synthesize flickrMostRecentPlacesArray = _flickrMostRecentPlacesArray;
@synthesize flickrMostRecentPlacesSet = _flickrMostRecentPlacesSet;
@synthesize theElementSectionsForTopPlaces = _theElementSectionsForTopPlaces;
@synthesize theElementSectionsForMostRecentPlaces = _theElementSectionsForMostRecentPlaces;
@synthesize flickrDataHandler = _flickrDataHandler;
@synthesize alertDelegate = _alertDelegate;

NSString *keyForMostRecentArray = @"mostRecentArrayKey";
NSString *keyForMostRecentSet = @"mostRecentSetKey";
NSString *alertTitle = @"Cannot Obtain Data";
NSString *alertMessage = @"We couldn't get the data from Flickr";

#pragma mark - Initialization sequence
- (id)init
{
	return [self initWithFlickrDataHandler:[[[FlickrDataHandler alloc] init] autorelease]];
}

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
{
	[super init];
	self.flickrDataHandler = flickrDataHandler;
	[self setupForTopPlacesArrayFromFlickr];
	[self setThePropertyForMostRecentPlaces];
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
		[self.alertDelegate displayAlertViewWithTitle:alertTitle withMessage:alertMessage];
	}
}

- (void)setThePropertyForMostRecentPlaces;
{
	self.flickrMostRecentPlacesArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:keyForMostRecentArray]];
	self.flickrMostRecentPlacesSet = [NSMutableSet setWithSet:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:keyForMostRecentSet]]];
}

#pragma mark - FlickrFunctions

- (void)addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionaryToAddToMostRecentList;
{
	id elementOfPlaceId = [dictionaryToAddToMostRecentList objectForKey:@"place_id"];
	NSString *stringOfPlaceId;
	if ([elementOfPlaceId isKindOfClass:[NSString class]])
	{
		stringOfPlaceId = (NSString *)elementOfPlaceId;
		//handle the set
		if ([self.flickrMostRecentPlacesSet containsObject:stringOfPlaceId])
		{
			int indexToRemove = [self returnIndexOf_flickrMostRecentPlacesArray_ThatContains:stringOfPlaceId];
			if (indexToRemove != -1)
				[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
		}
		else	[self.flickrMostRecentPlacesSet addObject:stringOfPlaceId];
		
		//handle the array
		[self.flickrMostRecentPlacesArray insertObject:dictionaryToAddToMostRecentList atIndex:0];
		
		if ([self.flickrMostRecentPlacesArray count] > MAX_MOST_RECENT_LIST) 
			[self.flickrMostRecentPlacesArray removeLastObject];
		//add to persistence.
		[self updateMostRecentDataToStandardUserDefaults];
	}
}

	- (int)returnIndexOf_flickrMostRecentPlacesArray_ThatContains:(NSString *)placed_idOfItsDictionary;
	{
		int indexToRemove = -1;
		for (int counter = 0; self.flickrMostRecentPlacesArray.count > counter ; counter++) 
		{
			if ([[self.flickrMostRecentPlacesArray objectAtIndex:counter] isKindOfClass:[NSDictionary class]])
			{
				NSDictionary *dictionary = [self.flickrMostRecentPlacesArray objectAtIndex:counter];
				if ([[dictionary objectForKey:@"place_id"] isEqual:placed_idOfItsDictionary])
				{
					indexToRemove = counter;
					counter = self.flickrMostRecentPlacesArray.count;
				}
			}
		}
		return indexToRemove;
	}

- (void)deleteFromMostRecentListThePlaceWithTheFollowing:(NSDictionary *)dictionaryToDelete
{
	//redo this parts
	[self.flickrMostRecentPlacesSet removeObject:[dictionaryToDelete valueForKey:@"place_id"]];
	[self.flickrMostRecentPlacesArray removeObjectAtIndex:[self returnIndexOf_flickrMostRecentPlacesArray_ThatContains:[dictionaryToDelete valueForKey:@"place_id"]]];
	[self updateMostRecentDataToStandardUserDefaults];
}

- (void)updateMostRecentDataToStandardUserDefaults
{
	[[NSUserDefaults standardUserDefaults] setObject:self.flickrMostRecentPlacesArray forKey:keyForMostRecentArray];
	[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.flickrMostRecentPlacesSet] forKey:keyForMostRecentSet];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSArray *)getPhotoListForSpecificFlickrPlaceID:(NSString *)flickrPlaceId
{
	NSArray *arrayOfPhotos = nil;
	id temporaryPhotoList = [self.flickrDataHandler getPhotoListsAtPlace:flickrPlaceId];
	if ([temporaryPhotoList isKindOfClass:[NSArray class]])
		arrayOfPhotos = (NSArray *) temporaryPhotoList;
	else
	{
		arrayOfPhotos = [NSArray array];
		[self.alertDelegate displayAlertViewWithTitle:alertTitle withMessage:alertMessage];
	}
	return arrayOfPhotos;
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

#pragma mark - Dealloc
- (void)dealloc
{
	[_flickrMostRecentPlacesArray release];
	[_flickrMostRecentPlacesSet release];
	[_flickrTopPlacesArray release];
	[super dealloc];
}

@end