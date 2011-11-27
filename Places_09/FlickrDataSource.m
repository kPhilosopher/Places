//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource.h"
#define MAX_MOST_RECENT_LIST 10

@interface FlickrDataSource()

@property (nonatomic,retain) NSMutableSet *flickrMostRecentPlacesSet;
@end


@implementation FlickrDataSource
@synthesize flickrTopPlacesArray, flickrMostRecentPlacesArray, flickrMostRecentPlacesSet;


-(id) init
{
	[super init];
	[self setThePropertyToTheTopPlacesFromFlickr];
	return self;
}

#pragma mark -
#pragma mark FlickrFunctions
-(void) setThePropertyToTheTopPlacesFromFlickr
{
	id temporaryFlickrTopPlaces = [FlickrFetcher topPlaces];
	if ([temporaryFlickrTopPlaces isKindOfClass:[NSArray class]])
		self.flickrTopPlacesArray = (NSArray *) temporaryFlickrTopPlaces;
	self.flickrMostRecentPlacesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"most_recent_array"];
	self.flickrMostRecentPlacesSet = [[NSUserDefaults standardUserDefaults] objectForKey:@"most_recent_set"];
}

-(void) addToTheMostRecentListOfPlacesTheFollowing:(NSIndexPath *)indexPath
{
	id elementOfPlaceId = [[self.flickrTopPlacesArray objectAtIndex:indexPath.row] objectForKey:@"place_id"];
	NSString *stringOfPlaceId;
	if ([elementOfPlaceId isKindOfClass:[NSString class]]) {
		stringOfPlaceId = (NSString *)elementOfPlaceId;
	}
	if ([self.flickrMostRecentPlacesSet containsObject:stringOfPlaceId])
	{
		int indexToRemove = -1;
		for (int counter = 0; self.flickrMostRecentPlacesArray.count > counter ; counter++) {
			if ([[self.flickrMostRecentPlacesArray objectAtIndex:counter] isKindOfClass:[NSDictionary class]])
			{
				NSDictionary *dictionary = [self.flickrMostRecentPlacesArray objectAtIndex:counter];
				if ([[dictionary objectForKey:@"place_id"] isEqual:stringOfPlaceId]) {
					indexToRemove = counter;
					counter = self.flickrMostRecentPlacesArray.count;
				}
			}
		}
		if (indexToRemove != -1)
			[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
	}
	else
	{
		[self.flickrMostRecentPlacesSet addObject:stringOfPlaceId];
	}
	[self.flickrMostRecentPlacesArray insertObject:[self.flickrTopPlacesArray objectAtIndex:indexPath.row] atIndex:0];
	
	if (self.flickrMostRecentPlacesArray.count == MAX_MOST_RECENT_LIST) {
		[self.flickrMostRecentPlacesArray removeLastObject];
	}
	
	[[NSUserDefaults standardUserDefaults] setValue:self.flickrMostRecentPlacesArray forKey:@"most_recent_array"];
	[[NSUserDefaults standardUserDefaults] setValue:self.flickrMostRecentPlacesSet forKey:@"most_recent_set"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSMutableArray *) flickrMostRecentPlacesArray
{
	if (!flickrMostRecentPlacesArray) {
		flickrMostRecentPlacesArray = [[NSMutableArray alloc] init];
	}
	return flickrMostRecentPlacesArray;
}

-(NSMutableSet *) flickrMostRecentPlacesSet
{
	if (!flickrMostRecentPlacesSet) {
		flickrMostRecentPlacesSet = [[NSMutableSet alloc] init];
	}
	return flickrMostRecentPlacesSet;
}

-(NSArray *) retrievePhotoListForSpecific:(NSString *)flickrPlaceId
{
	NSArray *arrayOfPhotos;
	id temporaryRetrievedPhotos = [FlickrFetcher photosAtPlace:flickrPlaceId];
	if ([temporaryRetrievedPhotos isKindOfClass:[NSArray class]])
		arrayOfPhotos = (NSArray *) temporaryRetrievedPhotos;
	return arrayOfPhotos;
}

-(BOOL)notifyRecentlyViewedPlaceWith:(int)index
{
	return YES;
}

//TODO: working
#pragma mark -
#pragma mark Dealloc
-(void)dealloc
{
	[flickrMostRecentPlacesArray release];
	[flickrMostRecentPlacesSet release];
	[flickrTopPlacesArray release];
	[super dealloc];
}

@end