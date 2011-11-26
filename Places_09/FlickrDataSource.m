//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource.h"

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
	
}

//-(NSDictionary *) getTheDictionaryFromMostRecentListAt:(NSIndexPath *) indexPath
//{
//	NSNumber *indexOfFlickrTopPlacesList = [NSNumber numberWithInt:[[self.flickrMostRecentPlacesArray objectAtIndex:indexPath.row] intValue]];
//	return [self.flickrTopPlacesArray objectAtIndex:[indexOfFlickrTopPlacesList intValue]];
//}

-(void) addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionary
{
//	NSLog(@"=-=======");
//	NSLog(@"addToTheMostRecentListOfPlacesTheFollowing");
//	NSLog(@"=-=======");
	
	if ([self.flickrMostRecentPlacesSet containsObject:dictionary])
	{
//		NSLog(@"addToTheMostRecentListOfPlacesTheFollowing[self.flickrMostRecentPlacesArray removeObject:dictionary];");
		[self.flickrMostRecentPlacesArray removeObject:dictionary];
	}
	else
	{
		[self.flickrMostRecentPlacesSet addObject:dictionary];
	}
	[self.flickrMostRecentPlacesArray insertObject:dictionary atIndex:0];
}

-(NSMutableArray *) flickrMostRecentPlacesArray
{
	if (!flickrMostRecentPlacesArray) {
		flickrMostRecentPlacesArray = [[NSMutableArray alloc] init];
	}
	return flickrMostRecentPlacesArray;
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