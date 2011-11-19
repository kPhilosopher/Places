//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource.h"

@implementation FlickrDataSource
@synthesize flickrTopPlacesArray, flickrFavoritePlacesArray;


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

-(NSArray *) retrievePhotosAtSpecific:(NSString *)flickrPlaceId
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
#pragma mark -
#pragma mark Properties
//-(NSArray *) flickrTopPlacesArray
//{
//    if (!flickrTopPlacesArray) 
//	{
//        flickrTopPlacesArray = [[NSArray alloc] init];
//    }
//	return flickrTopPlacesArray;
//}
#pragma mark -
#pragma mark Dealloc
-(void)dealloc
{
	[flickrTopPlacesArray release];
	[super dealloc];
}

@end