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
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	id temporaryFlickrTopPlaces = [FlickrFetcher topPlaces];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
	NSLog(@"=-=======");
	NSLog(@"addToTheMostRecentListOfPlacesTheFollowing");
	NSLog(@"=-=======");
	if ([self.flickrMostRecentPlacesSet containsObject:dictionary])
	{
		NSLog(@"addToTheMostRecentListOfPlacesTheFollowing[self.flickrMostRecentPlacesArray removeObject:dictionary];");
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
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	NSArray *arrayOfPhotos;
	id temporaryRetrievedPhotos = [FlickrFetcher photosAtPlace:flickrPlaceId];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	if ([temporaryRetrievedPhotos isKindOfClass:[NSArray class]])
		arrayOfPhotos = (NSArray *) temporaryRetrievedPhotos;
	return arrayOfPhotos;
}

-(BOOL)notifyRecentlyViewedPlaceWith:(int)index
{
	return YES;
}

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