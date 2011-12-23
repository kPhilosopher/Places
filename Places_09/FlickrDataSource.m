//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource-Hidden.h"
#define MAX_MOST_RECENT_LIST 10

@interface FlickrDataSource()

@property (nonatomic,retain) NSMutableSet *flickrMostRecentPlacesSet;

@end

@implementation FlickrDataSource
@synthesize flickrTopPlacesArray = _flickrTopPlacesArray;
@synthesize flickrMostRecentPlacesArray = _flickrMostRecentPlacesArray;
@synthesize flickrMostRecentPlacesSet = _flickrMostRecentPlacesSet;
@synthesize theElementSectionsForTopPlaces = _theElementSectionsForTopPlaces;
@synthesize theElementSectionsForMostRecentPlaces = _theElementSectionsForMostRecentPlaces;

#pragma mark - Initialization

- (id)init
{
	[super init];
	[self setThePropertyToTheTopPlacesFromFlickr];
	self.flickrMostRecentPlacesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"most_recent_array"];
	self.flickrMostRecentPlacesSet = 
	[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"most_recent_set"]];
	return self;
}

#pragma mark - FlickrFunctions
- (void)setThePropertyToTheTopPlacesFromFlickr;
{
	id temporaryFlickrTopPlaces = [FlickrFetcher topPlaces];
	if ([temporaryFlickrTopPlaces isKindOfClass:[NSArray class]])
		self.flickrTopPlacesArray = (NSArray *) temporaryFlickrTopPlaces;
}



-(void) addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionaryToAddToMostRecentList;
{
	id elementOfPlaceId = [dictionaryToAddToMostRecentList objectForKey:@"place_id"];
	NSString *stringOfPlaceId;
	if ([elementOfPlaceId isKindOfClass:[NSString class]])
	{
		stringOfPlaceId = (NSString *)elementOfPlaceId;
		if ([self.flickrMostRecentPlacesSet containsObject:stringOfPlaceId])
		{
			int indexToRemove = [self returnIndexOf_flickrMostRecentPlacesArray_ThatContains:stringOfPlaceId];
			if (indexToRemove != -1)
				[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
		}
		else	[self.flickrMostRecentPlacesSet addObject:stringOfPlaceId];
		
		[self.flickrMostRecentPlacesArray insertObject:dictionaryToAddToMostRecentList atIndex:0];
		
		if ([self.flickrMostRecentPlacesArray count] > MAX_MOST_RECENT_LIST) 
			[self.flickrMostRecentPlacesArray removeLastObject];
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
}

- (void)updateMostRecentDataToStandardUserDefaults
{
	[[NSUserDefaults standardUserDefaults] setObject:self.flickrMostRecentPlacesArray forKey:@"most_recent_array"];
	[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.flickrMostRecentPlacesSet] forKey:@"most_recent_set"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray *)flickrMostRecentPlacesArray
{
	if (!_flickrMostRecentPlacesArray)
		_flickrMostRecentPlacesArray = [[NSMutableArray alloc] init];
	[self performSelector:@selector(updateMostRecentDataToStandardUserDefaults) withObject:self afterDelay:0.5];
	return _flickrMostRecentPlacesArray;
}

- (NSMutableSet *)flickrMostRecentPlacesSet
{
	if (!_flickrMostRecentPlacesSet)
	{
		_flickrMostRecentPlacesSet = [[NSMutableSet alloc] init];
	}
	return _flickrMostRecentPlacesSet;
}

- (NSArray *)retrievePhotoListForSpecific:(NSString *)flickrPlaceId
{
	NSArray *arrayOfPhotos;
	id temporaryRetrievedPhotos = [FlickrFetcher photosAtPlace:flickrPlaceId];
	if ([temporaryRetrievedPhotos isKindOfClass:[NSArray class]])
		arrayOfPhotos = (NSArray *) temporaryRetrievedPhotos;
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot Retrieve Data" message:@"We couldn't retrieve the data from Flickr" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	return arrayOfPhotos;
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